import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluidTheme(
      data: FluidTheme.vibrantCyan,
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'brickr',
        theme: ThemeData(
          primaryColor: Liquids.vibrantCyan.dark,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
