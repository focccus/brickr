import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/widgets/details_card.dart';
import 'package:brickr/app/widgets/universal_part_card.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'set_controller.dart';

class SetPage extends StatefulWidget {
  final LegoSet s;
  const SetPage(this.s, {Key key}) : super(key: key);

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends ModularState<SetPage, SetController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getSet(widget.s);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.s == null) return Navigator.pop(context);
    super.didChangeDependencies();
  }

  void showDeleteDialog() async {
    final b = await showDialog(
      context: context,
      builder: (context) => FluidModal(
        title: Text('Delete?'),
        content: Text('Do you really want to delete the set?'),
        actions: [
          FluidButton(
            child: Text('No'),
            onTap: () => Navigator.of(context).pop(null),
          ),
          FluidButton.ghost(
            child: Text('Yes'),
            onTap: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (b != null) controller.removeSet();
  }

  void export() {
    final sett = controller.s.copyWith(parts: controller.parts);

    Navigator.of(context).pushNamed('/export', arguments: sett);
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context).primary;

    final isDesktop = MediaQuery.of(context).size.width >= 992;

    final details = Observer(builder: (_) {
      return DetailsCard(
        item: widget.s,
        cached: controller.cached,
        onCount: () => Navigator.of(context).pushNamed(
          '/count',
          arguments: controller.s,
        ),
        onDownload: controller.isLoading ? null : controller.saveSet,
        onDelete: showDeleteDialog,
        onExport: export,
      );
    });

    return FluidShell(
      appBar: FluidBar(
        color: theme.dark,
        title: Text('Set ${widget.s.id}'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 400,
              padding: EdgeInsets.all(16),
              child: details,
            ),
          Expanded(
            child: LayoutBuilder(builder: (_, size) {
              final rowCount = (size.maxWidth / 100).round();
              return Observer(
                builder: (_) => ListView.builder(
                  primary: controller.isLoading ?? true,
                  padding: EdgeInsets.all(16),
                  itemCount: controller.getrows(rowCount) + 2,
                  itemBuilder: (_, i) {
                    if (i == 0) {
                      return isDesktop ? SizedBox() : details;
                    }

                    if (i == 1) {
                      return controller.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : FluidTabs(
                              [
                                FluidTab('Parts'),
                                if (controller.showSpare)
                                  FluidTab('Spare Parts'),
                                if (controller.showOwned) FluidTab('Owned'),
                                if (controller.showMissing) FluidTab('Missing'),
                              ],
                              //selected: controller.tab,
                              onChange: controller.changeTab,
                              scrollable: true,
                            );
                    }

                    if (controller.isLoading) return null;

                    return DistributedGrid(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: rowCount,
                      children: controller
                              .getPartsRow(i - 2, rowCount)
                              ?.map(
                                (p) => UniversalPartCard(
                                  part: p,
                                  cached: controller.cached,
                                ),
                              )
                              ?.toList() ??
                          [
                            SizedBox(
                              height: 100,
                            ),
                          ],
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
