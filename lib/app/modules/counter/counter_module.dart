import 'package:brickr/app/modules/counter/counter_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/counter/counter_page.dart';

class CounterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CounterController(i.get(), i.get(), i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => CounterPage(args.data),
        ),
      ];

  static Inject get to => Inject<CounterModule>.of();
}
