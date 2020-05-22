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
  bool loading = true;

  @override
  void initState() {
    //controller.initParts(widget.s.copyWith());
    t = Timer.periodic(Duration(minutes: 2), (timer) => controller.saveSet());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.s == null) return Navigator.pop(context);

    controller.initParts(widget.s).then((value) {
      setState(() {
        loading = false;
      });
    });

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
      setState(() {
        controller.filter = ret;
      });
    }
  }

  Widget buildCard(SetPart p) => StatefulCard(
        p: p,
        useTap: controller.useTap,
        useSecondaryButtons: controller.useSecondary,
        addAmount: controller.addAmount,
        onTap: () => openPartDialog(p),
        addQuantity: controller.addQuantity,
        updateAll: () => setState(() {}),
      );

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
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
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
    );
  }
}

class StatefulCard extends StatefulWidget {
  final bool useTap;
  final bool useSecondaryButtons;
  final int addAmount;
  final SetPart p;
  final VoidCallback onTap;
  final VoidCallback updateAll;
  final bool Function(SetPart, int) addQuantity;

  const StatefulCard({
    Key key,
    this.useTap,
    this.useSecondaryButtons,
    this.p,
    this.onTap,
    this.updateAll,
    this.addQuantity,
    this.addAmount,
  }) : super(key: key);

  @override
  _StatefulCardState createState() => _StatefulCardState();
}

class _StatefulCardState extends State<StatefulCard> {
  void state(bool v) {
    if (v) widget.updateAll();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return UniversalPartCard(
      part: widget.p,
      cached: true,
      useTap: widget.useTap,
      useSecondaryButtons: widget.useSecondaryButtons,
      onTap: widget.onTap,
      onAdd: () => state(widget.addQuantity(widget.p, 1)),
      onAdd2: () => state(widget.addQuantity(widget.p, widget.addAmount)),
      onSubtract: () => state(widget.addQuantity(widget.p, -1)),
      onSubtract2: () => state(widget.addQuantity(widget.p, -widget.addAmount)),
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
