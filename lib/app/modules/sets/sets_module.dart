import 'package:brickr/app/modules/sets/sets_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:brickr/app/modules/sets/sets_page.dart';

class SetsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SetsController(i.get())),
      ];

  static Inject get to => Inject<SetsModule>.of();

  @override
  List<Router> get routers => [
        Router('', child: (_, args) => SetsPage()),
      ];
}
