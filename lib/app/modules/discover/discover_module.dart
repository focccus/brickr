import 'package:brickr/app/modules/discover/discover_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/discover/discover_page.dart';

class DiscoverModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DiscoverController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DiscoverPage()),
      ];

  static Inject get to => Inject<DiscoverModule>.of();
}
