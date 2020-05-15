import 'package:brickr/app/modules/parts/parts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/parts/parts_page.dart';

class PartsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PartsController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PartsPage()),
      ];

  static Inject get to => Inject<PartsModule>.of();
}
