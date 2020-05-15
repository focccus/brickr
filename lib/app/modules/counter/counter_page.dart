import 'dart:async';

import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/widgets/part_dialog.dart';
import 'package:brickr/app/widgets/part_filter.dart';
import 'package:brickr/app/widgets/universal_part_card.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'counter_controller.dart';

class CounterPage extends StatefulWidget {
  final LegoSet s;
  const CounterPage(this.s, {Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends ModularState<CounterPage, CounterController> {
  //use 'controller' variable to access controller

  Timer t;

  @override
  void initState() {
    controller.initParts(widget.s.copyWith());
    t = Timer.periodic(Duration(minutes: 2), (timer) => controller.saveSet());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.s == null) Navigator.pop(context);
    super.didChangeDependencies();
  }

  void dispose() {
    t?.cancel();

    super.dispose();
  }

  void openPartDialog(SetPart part) async {
    final res = await showDialog(
      context: context,
      builder: (_) => PartDialog(
        p: part.part,
        quantity: part.quantity,
        owned: part.owned,
      ),
    );

    if (res != null) {
      setState(() {
        controller.setQuantity(part, res);
      });
      controller.saveSet();
    }
  }

  void _openFilter() async {
    final ret = await showDialog(
      context: context,
      builder: (_) => FilterDialog(
        controller.filter,
        controller.colors.toList(),
      ),
    );

    if (ret != null && ret != controller.filter) {
      controller.filter = ret;
    }
  }

  Widget buildCard(SetPart p) => StatefulBuilder(builder: (_, st) {
        void state(bool v) => v ? setState(() {}) : st(() {});

        return UniversalPartCard(
          part: p,
          useTap: controller.useTap,
          useSecondaryButtons: controller.useSecondary,
          onTap: () => openPartDialog(p),
          onAdd: () => state(controller.addQuantity(p)),
          onAdd2: () => state(controller.addQuantity(p, controller.addAmount)),
          onSubtract: () => state(controller.addQuantity(p, -1)),
          onSubtract2: () =>
              state(controller.addQuantity(p, -controller.addAmount)),
        );
      });

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    return WillPopScope(
      onWillPop: controller.saveSet,
      child: FluidShell(
        appBar: FluidBar(
          leading: FluidIconButton(
            small: true,
            icon: Icon(LiquidIcons.arrow_left),
            onTap: () => controller
                .saveSet()
                .then((b) => b ? Navigator.pop(context) : null),
            theme: FluidButtonTheme(null, Colors.white),
            //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          actions: [
            FluidIconButton.ghost(
              icon: Icon(LiquidIcons.filter),
              color: Colors.white70,
              onTap: _openFilter,
            )
          ],
          color: theme.primary.dark,
          title: Text('Set ${widget.s.id}'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) => ListView(
            padding: EdgeInsets.all(8),
            children: <Widget>[
              CountSection(
                null,
                controller.parts,
                buildCard,
              ),
              if (controller.showSpare)
                CountSection(
                  'Spare Parts',
                  controller.spare,
                  buildCard,
                ),
              if (controller.showOwned)
                CountSection(
                  'Complete',
                  controller.owned,
                  buildCard,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountSection extends StatelessWidget {
  final String text;
  final List<SetPart> parts;
  final Widget Function(SetPart) builder;

  const CountSection(this.text, this.parts, this.builder);

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context).typography;
    final rowCount = (MediaQuery.of(context).size.width / 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              text,
              style: theme.h3,
            ),
          ),
        DistributedGrid(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: rowCount,
          children: parts.map(builder).toList(),
        ),
      ],
    );
  }
}
