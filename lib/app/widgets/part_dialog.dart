import 'package:brickr/app/models/part.dart';
import 'package:brickr/app/widgets/platform/export.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class PartDialog extends StatefulWidget {
  final Part p;
  final int quantity;
  final int owned;
  final bool hasMaxVal;

  const PartDialog({
    Key key,
    this.p,
    this.quantity,
    this.hasMaxVal = true,
    this.owned,
  }) : super(key: key);

  @override
  _PartDialogState createState() => _PartDialogState();
}

class _PartDialogState extends State<PartDialog> {
  TextEditingController t;

  @override
  void initState() {
    t = TextEditingController(text: widget.owned.toString());
    super.initState();
  }

  void dispose() {
    t.dispose();
    super.dispose();
  }

  String error;

  void saveAndExit() {
    error = null;
    int val = int.tryParse(t.text);
    if (val == null) {
      return setState(() {
        error = 'Please enter a valid number!';
      });
    }
    if (val < 0 || val > widget.quantity && widget.hasMaxVal) {
      return setState(() {
        error = 'Please enter a number between 0 and ${widget.quantity}';
      });
    }

    if (val == widget.owned) return Navigator.of(context).pop();

    return Navigator.of(context).pop(val);
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    return FluidModal(
      title: Text('Part ${widget.p.id}'),
      content: Column(
        children: [
          CustomImage(widget.p.getPreview()),
          Text(
            widget.p.id,
            style: theme.typography.h3,
          ),
          Text(
            widget.p.name,
            style: theme.typography.smallBody,
            softWrap: true,
          ),
          SizedBox(
            height: 16,
          ),
          if (widget.p.color != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32, child: Text('Color: ')),
                SizedBox(width: 8),
                FluidTag(
                  label: Text(widget.p.color.name),
                  color: widget.p.color.color,
                )
              ],
            ),
          Row(
            children: <Widget>[
              Text(
                'Total Quantity:',
              ),
              Text(
                widget.quantity.toString(),
                style: theme.typography.mediumHighlight,
              )
            ],
          ),
          FluidInput(
            autofocus: true,
            controller: t,
            label: Text('Owned Parts'),
            errorText: error,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(fillColor: Liquids.sensitiveGrey),
            onSubmitted: (_) => saveAndExit(),
          )
        ],
      ),
      actions: [
        FluidButton(
          child: Text('Save'),
          onTap: saveAndExit,
        )
      ],
    );
  }
}
