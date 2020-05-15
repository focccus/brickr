import 'package:brickr/app/modules/options/options_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/options/options_page.dart';

class OptionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OptionsController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OptionsPage()),
      ];

  static Inject get to => Inject<OptionsModule>.of();
}
