import 'package:brickr/app/models/color.dart';
import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/models/part_filter.dart';
import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/options_repository.dart';
import 'package:brickr/app/repositories/part_repository.dart';
import 'package:brickr/app/repositories/set_repository.dart';
import 'package:mobx/mobx.dart';

part 'counter_controller.g.dart';

class CounterController = _CounterControllerBase with _$CounterController;

abstract class _CounterControllerBase with Store {
  SetRepository repo;
  PartRepository partRepo;
  OptionsRepository options;

  _CounterControllerBase(this.repo, this.partRepo, this.options);

  @observable
  LegoSet s;

  @observable
  PartFilter filter;

  @observable
  bool useSecondary = false;

  @observable
  bool useTap = false;

  @observable
  int addAmount = 10;

  @action
  void initParts(LegoSet se) {
    filter = PartFilter();
    s = se;
    se.parts.forEach((p) {
      if (p?.part?.color != null) {
        colors.add(p.part.color);
      }
    });

    initOptions();
  }

  @action
  Future initOptions() async {
    try {
      useSecondary = await options.getOption('useSecondary') ?? false;
      useTap = await options.getOption('useTap') ?? false;
      addAmount = await options.getOption('addAmount') ?? 10;

      filter = PartFilter(
        showOwned: await options.getOption('showCompleted') ?? true,
        showSpare: await options.getOption('showSpare') ?? false,
        sorting: sortByFromString(await options.getOption('sorting')),
      );
    } catch (e) {
      print(e);
    }
  }

  @computed
  List<SetPart> get parts {
    final ret = s?.parts
            ?.where((p) => p.owned < p.quantity && filter.filter(p.part))
            ?.toList() ??
        [];

    ret.sort((a, b) => filter.sort(b.part, a.part));
    return ret;
  }

  @computed
  List<SetPart> get spare =>
      s?.spareparts
          ?.where((p) => p.owned < p.quantity && filter.filter(p.part))
          ?.toList() ??
      [];

  @computed
  List<SetPart> get owned {
    final ret = [...s.parts, ...s.spareparts]
            .where((p) => p.owned == p.quantity && filter.filter(p.part))
            ?.toList() ??
        [];

    ret.sort((a, b) => filter.sort(b.part, a.part));
    return ret;
  }

  @computed
  bool get showOwned =>
      filter.showOwned &&
      (s?.parts?.any((p) => p.owned == p.quantity) ??
          false || (s?.spareparts?.any((p) => p.owned == p.quantity) ?? false));
  @computed
  bool get showSpare =>
      filter.showSpare && (s?.spareparts?.isNotEmpty ?? false);

  Set<LegoColor> colors = {};

  Map<Part, int> changes = {};

  @action
  bool addQuantity(SetPart p, [int q = 1]) {
    if (p.owned == p.quantity && q > 0) q = -q;
    if (p.owned == 0 && q < 0) q = -q;

    bool ret = p.owned == p.quantity || p.owned == p.quantity - 1 && q > 0;

    if (p.owned + q >= p.quantity) {
      // set to quantity
      q = p.quantity - p.owned;
      ret = true;
    }
    if (p.owned + q <= 0) {
      // set to 0
      q = -p.owned;
    }
    p.owned += q;

    // push changes to the parts
    if (changes.containsKey(p.part)) {
      changes[p.part] += q;
    } else {
      changes[p.part] = q;
    }
    return ret;
  }

  @action
  void setQuantity(SetPart p, int q) {
    addQuantity(p, q - p.owned);
  }

  Future<bool> saveSet() async {
    try {
      await repo.saveSet(s);

      for (var part in changes.keys) {
        part = part.copyWith(owned: part.owned ?? 0 + changes[part]);
      }

      print('saved set ${s.id}');

      await options.saveOption('showSpare', showSpare);
      await options.saveOption('showCompleted', showOwned);
      await options.saveOption('sorting', filter.sorting.toString());

      return true;
    } catch (e) {
      return false;
    }
  }
}
