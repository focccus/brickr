import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/part_repository.dart';
import 'package:brickr/app/repositories/rebrickable.dart';
import 'package:brickr/app/repositories/set_repository.dart';
import 'package:mobx/mobx.dart';

part 'set_controller.g.dart';

class SetController = _SetControllerBase with _$SetController;

abstract class _SetControllerBase with Store {
  RebrickableAPI api;
  SetRepository repo;
  PartRepository partrepo;

  _SetControllerBase(this.api, this.partrepo, this.repo);

  LegoSet s;

  @observable
  bool isLoading = true;

  @observable
  bool cached = false;

  @observable
  List<SetPart> parts = [];

  @computed
  bool get showOwned =>
      cached && (s?.parts?.any((p) => p.owned == p.quantity) ?? false);
  @computed
  bool get showSpare => s?.spareparts?.isNotEmpty ?? false;
  bool get showMissing =>
      cached &&
      (s.parts.where((p) => p.owned >= 1).length > s.parts.length * 0.2 ??
          false);

  @action
  void changeTab(int i) {
    if (i == 1) {
      if (showSpare) {
        parts = s?.spareparts;
        print('new parts');
        return;
      } else {
        i++;
      }
    }
    if (i == 2) {
      parts = s.parts.where((p) => p.owned == p.quantity)?.toList() ?? [];
      return;
    }
    if (i == 3) {
      parts = s.parts?.where((p) => p.owned < p.quantity)?.toList() ?? [];
      return;
    }

    parts = s.parts ?? [];
  }

  Future saveSet() async {
    try {
      await repo.addNewSet(s);

      List<Future> futures = [];

      for (var p in [...s.parts, ...s.spareparts]) {
        futures.add(partrepo.addPart(p.part));
      }

      //s.parts.forEach((p) => partrepo.addPart(p.part));

      await Future.wait(futures);

      cached = true;
    } catch (err) {
      print(err);
    }
  }

  Future removeSet() async {
    try {
      await repo.deleteSet(s.id);

      cached = false;

      getSet(s);
    } catch (err) {
      print(err);
    }
  }

  @action
  Future getSet(LegoSet legoSet) async {
    s = legoSet;
    isLoading = true;

    cached = await repo.hasSet(s.id);

    if (cached) {
      s = await repo.getSetByID(s.id);

      parts = s.parts ?? [];

      if (s.parts != null) {
        for (var part in s.parts) {
          part.part = await partrepo.getPartByID(part.id);
        }
      }
      if (s.spareparts != null) {
        for (var part in s.spareparts) {
          part.part = await partrepo.getPartByID(part.id);
        }
      }

      await Future.delayed(Duration(milliseconds: 500));
    } else {
      await downloadParts();
    }

    isLoading = false;
  }

  Future downloadParts() async {
    try {
      final data = await api.getParts(s.id);

      assert(data != null);

      List<SetPart> parts = data
          .where((p) => p['is_spare'] == null || p['is_spare'] == false)
          .map((p) => SetPart.fromMap(p).copyWith(part: Part.fromMap(p)))
          .toList();
      List<SetPart> spare = data
          .where((p) => p['is_spare'] != null && p['is_spare'])
          .map((p) => SetPart.fromMap(p).copyWith(part: Part.fromMap(p)))
          .toList();

      this.parts = parts ?? [];

      s = s.copyWith(parts: parts, spareparts: spare);
    } catch (err) {}
  }

  List<SetPart> getPartsRow(int row, int count) {
    if ((row + 1) * count <= parts.length) {
      return parts?.sublist(row * count, row * count + count);
    }

    if (row * count <= parts.length) {
      return parts?.sublist(row * count, parts.length);
    }
    return null;
  }

  int getrows(int count) => (parts.length / count).ceil();
}
