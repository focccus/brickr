import 'package:brickr/app/models/preview_set.dart';
import 'package:brickr/app/widgets/platform/export.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/cupertino.dart';

class SetTile extends StatelessWidget {
  final LegoSet s;
  final VoidCallback onTap;
  final bool cached;

  const SetTile({Key key, @required this.s, this.onTap, this.cached})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: FluidInteractiveCard(
        onTap: onTap,
        borderRadius: 4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomImage(
                s.getPreview(),
                errorWidget: (_, ex, s) => Center(
                  child: Text('Not available'),
                ),
                cached: cached,
              ),
            ),
            Text(
              s.name ?? '',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
            Text(s.id ?? '', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
