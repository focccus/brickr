import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/set_repository.dart';
import 'package:mobx/mobx.dart';

part 'sets_controller.g.dart';

class SetsController = _SetsControllerBase with _$SetsController;

abstract class _SetsControllerBase with Store {
  SetRepository repo;

  _SetsControllerBase(this.repo);

  @observable
  List<LegoSet> sets = [];

  @action
  Future getSets() async {
    sets = await repo.getAllSets();
    print(sets);
  }
}
