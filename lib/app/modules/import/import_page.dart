import 'package:brickr/app/repositories/platforms.dart';
import 'package:brickr/app/widgets/details_card.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'import_controller.dart';

class ImportPage extends StatefulWidget {
  final String title;
  const ImportPage({Key key, this.title = "Import"}) : super(key: key);

  @override
  _ImportPageState createState() => _ImportPageState();
}

class _ImportPageState extends ModularState<ImportPage, ImportController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.import();
    super.initState();
  }

  void add() {
    controller.addSet().then((b) => b ? Navigator.of(context).pop() : null);
  }

  @override
  Widget build(BuildContext context) {
    return FluidShell(
      appBar: FluidBar(
        color: Liquids.vibrantYellow,
        automaticallyImplyLeading: false,
        title: Text("Import"),
      ),
      body: Observer(builder: (_) {
        if (!controller.status) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FluidButton(
                  child: Text('Import File'),
                  onTap: controller.import,
                ),
                if (controller.error != null) Text(controller.error),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: FluidCard(
            child: Column(
              children: [
                DetailsCard(
                  item: controller.s,
                ),
                FluidButton.highlight(
                  child: Text('Import Set'),
                  onTap: add,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
