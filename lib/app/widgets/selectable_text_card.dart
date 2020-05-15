import 'package:brickr/app/repositories/platforms.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class SelectableTextCard extends StatelessWidget {
  final String text;

  SelectableTextCard(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FluidIconButton(
            icon: Icon(LiquidIcons.clip),
            child: Text("Copy"),
            onTap: () => copyToClipboard(text),
          ),
          SizedBox(
            height: 8,
          ),
          FluidCard(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
