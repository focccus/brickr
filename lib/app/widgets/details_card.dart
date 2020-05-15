import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/widgets/platform/export.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final LegoSet item;
  final bool cached;
  final VoidCallback onDownload;
  final VoidCallback onCount;
  final VoidCallback onExport;
  final VoidCallback onDelete;

  const DetailsCard({
    Key key,
    @required this.item,
    this.cached = false,
    this.onDownload,
    this.onCount,
    this.onExport,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = _DetailsContent(
      item: item,
      cached: cached,
      onCount: onCount,
      onDelete: onDelete,
      onDownload: onDownload,
      onExport: onExport,
    );

    Column horizontal(double w) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              item.img,
              cached: cached,
              width: w / 2,
            ),
            content,
          ],
        );

    return FluidCard(
      alignChild: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: LayoutBuilder(
        builder: (_, size) => ResponsiveWidget(
          fallback: horizontal(size.maxWidth),
          desktop: horizontal(size.maxWidth),
          tablet: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                item.img,
                width: size.maxWidth / 3,
              ),
              Expanded(
                child: content,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final LegoSet item;
  final bool cached;
  final VoidCallback onDownload;
  final VoidCallback onCount;
  final VoidCallback onExport;
  final VoidCallback onDelete;

  const _DetailsContent({
    Key key,
    @required this.item,
    this.cached = false,
    this.onDownload,
    this.onCount,
    this.onExport,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    return Column(
      children: [
        Text(item.id, style: theme.typography.xlargeBody),
        SizedBox(
          height: 15,
        ),
        Text(
          item.name,
          style: theme.typography.largeBody.copyWith(
            color: Liquids.richBlack.lighter,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "${item.numparts} Parts - ${item.year}",
          style: theme.typography.smallBody.copyWith(
            color: Liquids.richBlack.lighter,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        cached
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FluidIconButton(
                    icon: Icon(LiquidIcons.logistics),
                    child: Text("Zählen"),
                    onTap: onCount,
                  ),
                  FluidIconButton.highlight(
                    icon: Icon(LiquidIcons.exportfile),
                    child: MediaQuery.of(context).size.width > 500
                        ? Text("Export")
                        : null,
                    onTap: onExport,
                  ),
                  FluidIconButton(
                    icon: Icon(LiquidIcons.bin),
                    theme: FluidButtonTheme(
                      Liquids.transparent,
                      theme.errorColor,
                      activeBackground: theme.errorColor.withOpacity(0.2),
                    ),
                    onTap: onDelete,
                  )
                ],
              )
            : (onDownload != null
                ? FluidIconButton.primary(
                    icon: Icon(LiquidIcons.add),
                    child: Text("Add"),
                    onTap: onDownload,
                  )
                : SizedBox()),
      ],
    );
  }
}
