import 'dart:convert';

import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/repositories/platforms.dart';
import 'package:brickr/app/widgets/selectable_text_card.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class ExportPage extends StatelessWidget {
  final LegoSet sett;
  const ExportPage(this.sett, {Key key}) : super(key: key);

  String _toJson() {
    return json.encode(sett.parts.map((part) => part.toMap()).toList());
  }

  String _toCsv() {
    return "id, Name, Quantity, Owned Quantity, is spare\n" +
        sett.parts.map((part) => part.toCsv()).join("\n");
  }

  String _toText() {
    return sett.parts.map((part) => part.toText()).join("\n");
  }

  void exportToFile() {
    saveFile(sett.name + '.brickr', sett.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return FluidShell(
      appBar: FluidBar(
        color: Liquids.vibrantYellow,
        automaticallyImplyLeading: false,
        title: Text("Export as"),
        actions: <Widget>[
          FluidIconButton.highlight(
            icon: Icon(LiquidIcons.close),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          FluidTabs(
            [
              FluidTab(
                "Text",
                child: SelectableTextCard(_toText()),
              ),
              FluidTab(
                "File",
              ),
              FluidTab(
                "Json",
                child: SelectableTextCard(_toJson()),
              ),
              FluidTab(
                "CSV",
                child: SelectableTextCard(_toCsv()),
              ),
            ],
            onChange: (i) {
              if (i == 1) exportToFile();
            },
            scrollable: true,
          ),
        ],
      ),
    );
  }
}
