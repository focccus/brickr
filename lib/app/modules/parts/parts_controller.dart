import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/repositories/part_repository.dart';
import 'package:mobx/mobx.dart';

part 'parts_controller.g.dart';

class PartsController = _PartsControllerBase with _$PartsController;

abstract class _PartsControllerBase with Store {
  final PartRepository repo;

  _PartsControllerBase(this.repo);

  @observable
  ObservableList<String> ids;

  @observable
  bool isLoading = true;

  @action
  Future getPartIds() async {
    isLoading = true;
    ids = ObservableList.of(await repo.getIDs());
    print(ids);
    isLoading = false;
  }

  Future<Part> addQuantity(Part p, int q) async {
    print(q);
    print(p.quantity);

    p = p.copyWith(quantity: (p.quantity ?? 0) + q, owned: (p.owned ?? 0) + q);
    await repo.savePart(p);
    return p;
  }
}
