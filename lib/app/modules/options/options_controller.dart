import 'package:brickr/app/repositories/options_repository.dart';
import 'package:mobx/mobx.dart';

part 'options_controller.g.dart';

class OptionsController = _OptionsControllerBase with _$OptionsController;

abstract class _OptionsControllerBase with Store {
  final OptionsRepository repo;

  _OptionsControllerBase(this.repo);

  Future<void> load() async {
    useSecondary = await repo.getOption('useSecondary') ?? false;
    useTap = await repo.getOption('useTap') ?? false;
    addAmount = await repo.getOption('addAmount') ?? 10;
    showSpare = await repo.getOption('showSpare') ?? false;
    showCompleted = await repo.getOption('showCompleted') ?? true;
  }

  Future<bool> save() async {
    print('saving options');
    await repo.saveOption('useSecondary', useSecondary);
    await repo.saveOption('useTap', useTap);
    await repo.saveOption('addAmount', addAmount);
    await repo.saveOption('showSpare', showSpare);
    await repo.saveOption('showCompleted', showCompleted);
    return true;
  }

  @observable
  bool useSecondary = false;

  @observable
  bool useTap = false;

  @observable
  int addAmount = 10;

  @observable
  bool showSpare = false;
  @observable
  bool showCompleted = true;
}
