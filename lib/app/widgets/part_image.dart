import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/widgets/platform/export.dart';
import 'package:fluix/theme/colors.dart';
import 'package:flutter/material.dart';

class PartImage extends StatelessWidget {
  final SetPart part;
  final bool cached;

  PartImage(this.part, this.cached);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        right: 8,
        left: 8,
      ),
      child: Stack(
        children: <Widget>[
          CustomImage(
            part.part.getPreview(),
            errorWidget: (_, __, ___) => Center(
              child: Text('Not available'),
            ),
            cached: cached,
          ),
          if (part.part.length != null)
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                alignment: Alignment.center,
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: Text(
                  part.part.length.toString().replaceFirst(".0", ""),
                  style: TextStyle(
                    color: Color(0xff74b4ea),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
