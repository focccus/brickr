import 'package:flutter_modular/flutter_modular.dart';
import 'package:brickr/app/modules/export/export_page.dart';

class ExportModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ExportPage(args.data)),
      ];

  static Inject get to => Inject<ExportModule>.of();
}
