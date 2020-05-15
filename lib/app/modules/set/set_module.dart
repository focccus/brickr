import 'package:brickr/app/modules/set/set_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/set/set_page.dart';

class SetModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SetController(i.get(), i.get(), i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SetPage(args.data)),
      ];

  static Inject get to => Inject<SetModule>.of();
}
