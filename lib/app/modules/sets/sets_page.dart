import 'package:brickr/app/widgets/home_scaffold.dart';
import 'package:brickr/app/widgets/set_tile.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sets_controller.dart';

class SetsPage extends StatefulWidget {
  const SetsPage({Key key}) : super(key: key);

  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends ModularState<SetsPage, SetsController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getSets();
    super.initState();
  }

  void pushAndReload(String path, [Object a]) {
    Navigator.of(context)
        .pushNamed(path, arguments: a)
        .then((value) => controller.getSets());
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    final w = MediaQuery.of(context).size.width;

    final rowCount = (w / 140).round();

    return HomeScaffold(
      'Sets',
      actions: [
        FluidIconButton.highlight(
          small: true,
          child: Text('Import'),
          onTap: () => pushAndReload('/import'),
          icon: Icon(LiquidIcons.cloudupload),
        )
      ],
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => DistributedGrid(
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: rowCount,
            children: [
              ...controller.sets.map(
                (s) => SetTile(
                  s: s,
                  onTap: () => pushAndReload('/set', s),
                  cached: true,
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: FluidInteractiveCard(
                  borderRadius: 4.0,
                  onTap: () => pushAndReload('/discover'),
                  backgroundColor: Liquids.sensitiveGrey.dark,
                  child: Icon(
                    LiquidIcons.plus,
                    color: theme.primary,
                  ),
                  alignChild: Alignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
