import 'dart:async';

import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/rebrickable.dart';
import 'package:mobx/mobx.dart';

part 'discover_controller.g.dart';

class DiscoverController = _DiscoverControllerBase with _$DiscoverController;

abstract class _DiscoverControllerBase with Store {
  RebrickableAPI api;

  @observable
  bool isLoading = true;

  @observable
  int pageCount = 0;

  @action
  Future loadResults(int count, [String s]) async {
    print('search $s');

    isLoading = true;
    pageCount = await api.getPageCount(s, 30);

    pageCount ??= 0;
    cached = {};
    isLoading = false;
  }

  Map<int, List<LegoSet>> cached = {};

  Future<List<LegoSet>> getSets(int page, String search, int count) async {
    if (cached.containsKey(page)) return cached[page];

    final sets = await api.searchSets(page, search, count);
    if (sets != null && sets.isNotEmpty) {
      cached[page] = sets;
      return sets;
    }
    return [];
  }

  _DiscoverControllerBase(this.api);
}
