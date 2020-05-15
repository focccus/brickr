import 'package:brickr/app/modules/import/import_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/import/import_page.dart';

class ImportModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ImportController(i.get(),i.get(),i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ImportPage()),
      ];

  static Inject get to => Inject<ImportModule>.of();
}
