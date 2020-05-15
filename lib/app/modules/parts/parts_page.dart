import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/widgets/home_scaffold.dart';
import 'package:brickr/app/widgets/part_dialog.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'parts_controller.dart';

class PartsPage extends StatefulWidget {
  final String title;
  const PartsPage({Key key, this.title = "Parts"}) : super(key: key);

  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends ModularState<PartsPage, PartsController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getPartIds();
    super.initState();
  }

  Future openDialog(Part p) async {
    final prevQ = p.owned ?? 0;
    final ret = await showDialog(
      context: context,
      builder: (_) => PartDialog(
        p: p,
        quantity: p.quantity ?? 0,
        owned: prevQ,
        hasMaxVal: false,
      ),
    );

    print(ret);

    if (ret != null) {
      p = await controller.addQuantity(p, ret - prevQ);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      'Parts',
      body: Observer(builder: (context) {
        if (controller.isLoading) return Container();

        return ListView.builder(
          itemCount: controller.ids.length,
          itemBuilder: (_, i) => FutureBuilder<Part>(
            future: controller.repo.getPartByID(controller.ids[i]),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                final p = snap.data;

                return FluidListItem(
                  leading: Image.network(p.getPreview()),
                  title: Text(p.name + ' (${p.id})'),
                  trailing: Text((p.owned ?? 0).toString()),
                  onTap: () => openDialog(p),
                );
              }

              return FluidListItem(
                leading: CircularProgressIndicator(),
                title: null,
              );
            },
          ),
        );
      }),
    );
  }
}
