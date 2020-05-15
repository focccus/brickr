import 'dart:convert';

import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/part_repository.dart';
import 'package:brickr/app/repositories/platforms.dart';
import 'package:brickr/app/repositories/rebrickable.dart';
import 'package:brickr/app/repositories/set_repository.dart';
import 'package:mobx/mobx.dart';

part 'import_controller.g.dart';

class ImportController = _ImportControllerBase with _$ImportController;

abstract class _ImportControllerBase with Store {
  final RebrickableAPI api;
  final PartRepository partrepo;
  final SetRepository repo;

  _ImportControllerBase(this.api, this.partrepo, this.repo);

  @observable
  bool status = false;

  @observable
  String error;

  LegoSet s;

  Future<bool> addSet() async {
    final counts = <String, SetPart>{};

    for (var part in [...s.parts, ...s.spareparts]) {
      counts[part.id + part.quantity.toString()] = part;
    }

    try {
      final data = await api.getParts(s.id);

      assert(data != null);

      List<SetPart> parts = data
          .where((p) => p['is_spare'] == null || p['is_spare'] == false)
          .map(
            (p) => SetPart.fromMap(p).copyWith(
                part: Part.fromMap(p),
                owned: counts[p['part']['part_num'] +
                        p['part']['quantity'].toString()]
                    ?.owned),
          )
          .toList();
      List<SetPart> spare = data
          .where((p) => p['is_spare'] != null && p['is_spare'])
          .map(
            (p) => SetPart.fromMap(p).copyWith(
              part: Part.fromMap(p),
              owned: counts[
                      p['part']['part_num'] + p['part']['quantity'].toString()]
                  ?.owned,
            ),
          )
          .toList();

      s = s.copyWith(parts: parts, spareparts: spare);

      await repo.addNewSet(s);

      List<Future> futures = [];

      for (var p in [...s.parts, ...s.spareparts]) {
        futures.add(partrepo.addPart(p.part));
      }

      //s.parts.forEach((p) => partrepo.addPart(p.part));

      await Future.wait(futures);

      return true;
    } catch (err) {
      print(err);

      status = false;
      error = 'An Error occured while adding parts. Please try again.';
      return false;
    }
  }

  void import() async {
    status = false;
    error = null;
    try {
      final j = await selectFile(['brickr']);

      s = LegoSet.fromJson(j);

      if (s.id != null &&
          s.name != null &&
          s.year != null &&
          s.img != null &&
          s.parts != null) {
      } else {
        throw ('Parsing Error');
      }

      status = true;
    } catch (err) {
      s = null;
      error = 'Please select a brickr file!';
      status = false;
    }
  }
}
