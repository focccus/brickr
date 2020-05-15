import 'package:brickr/app/models/preview_set.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/cupertino.dart';

import '../transparent_image.dart';
import 'network_image.dart';

class SetTile extends StatelessWidget {
  final LegoSet s;
  final VoidCallback onTap;

  const SetTile({Key key, @required this.s, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget img;

    try {
      print(s.getPreview());
      img = Image.network(
        s.getPreview() ?? '',
        errorBuilder: (_, ex, s) => Center(
          child: Text('Not available'),
        ),
        //placeholder: kTransparentImage,
      );
    } catch (e) {
      img = Text('Not available');
    }

    return AspectRatio(
      aspectRatio: 1,
      child: FluidInteractiveCard(
        onTap: onTap,
        borderRadius: 4,
        child: Column(
          children: <Widget>[
            Expanded(child: img),
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
