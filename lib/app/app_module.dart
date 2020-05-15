import 'package:brickr/app/app_controller.dart';
import 'package:brickr/app/modules/options/options_module.dart';
import 'package:brickr/app/repositories/options_repository.dart';
import 'package:brickr/app/repositories/part_repository.dart';
import 'package:brickr/app/repositories/rebrickable.dart';
import 'package:brickr/app/repositories/set_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:brickr/app/app_widget.dart';

import 'modules/counter/counter_module.dart';
import 'modules/discover/discover_module.dart';
import 'modules/export/export_module.dart';
import 'modules/import/import_module.dart';
import 'modules/parts/parts_module.dart';
import 'modules/set/set_module.dart';
import 'modules/sets/sets_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => RebrickableAPI(i.get())),
        Bind((i) => SetRepository()),
        Bind((i) => PartRepository()),
        Bind((i) => OptionsRepository()),
        Bind(
          (i) => Dio(
            BaseOptions(
              baseUrl: 'https://rebrickable.com/api/v3/lego/',
              headers: {
                'Authorization': 'key ' + RebrickableAPI.KEY,
              },
            ),
          ),
        )
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SetsModule()),
        Router('/discover', module: DiscoverModule()),
        Router('/set', module: SetModule()),
        Router('/count', module: CounterModule()),
        Router('/parts', module: PartsModule()),
        Router('/options', module: OptionsModule()),
        Router('/export', module: ExportModule()),
        Router('/import', module: ImportModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
