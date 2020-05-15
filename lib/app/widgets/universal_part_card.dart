import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/widgets/part_image.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class UniversalPartCard extends StatelessWidget {
  final SetPart part;
  final bool useTap;
  final bool useSecondaryButtons;
  final bool cached;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onAdd2;
  final VoidCallback onSubtract2;

  const UniversalPartCard({
    Key key,
    @required this.part,
    this.useTap = false,
    this.useSecondaryButtons = false,
    this.cached,
    this.onTap,
    this.onAdd,
    this.onSubtract,
    this.onAdd2,
    this.onSubtract2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          FluidCard(
            padding: EdgeInsets.all(0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                PartImage(part),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  height: 20,
                  alignment: Alignment.center,
                  color: Liquids.sensitiveGrey.lighter.withAlpha(100),
                  child: Text("${part.owned} / ${part.quantity}"),
                ),
              ],
            ),
          ),

          // Touch Detectors
          if (useTap != null)
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onLongPress: onTap,
                            onTap:
                                useSecondaryButtons ? onSubtract2 : onSubtract,
                          ),
                        ),
                        if (useTap)
                          Expanded(
                            child: GestureDetector(
                              onTap: onTap,
                            ),
                          ),
                        Expanded(
                          child: GestureDetector(
                            onLongPress: onTap,
                            onTap: useSecondaryButtons ? onAdd2 : onAdd,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        if (onSubtract != null)
                          Expanded(
                              child: GestureDetector(
                            onTap: onSubtract,
                            onLongPress: onTap,
                          )),
                        if (onAdd != null)
                          Expanded(
                              child: GestureDetector(
                            onTap: onAdd,
                            onLongPress: onTap,
                          )),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
