import 'package:brickr/app/models/color.dart';
import 'package:brickr/app/models/part_filter.dart';
import 'package:fluix/fluix.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  final PartFilter filter;
  final List<LegoColor> colors;

  FilterDialog(this.filter, this.colors);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  TextEditingController controller;

  List<LegoColor> selectedColors;

  SortBy sorting;

  bool showSpare;

  bool showOwned;

  @override
  void initState() {
    controller = TextEditingController(text: widget.filter.text);

    selectedColors = List.from(widget.filter.colors ?? []);

    sorting = widget.filter.sorting;

    showSpare = widget.filter.showSpare ?? false;
    showOwned = widget.filter.showOwned ?? true;

    super.initState();
  }

  String getSorting(SortBy sorting) {
    switch (sorting) {
      case SortBy.length:
        return 'Length';
      case SortBy.color:
        return 'Color';
      case SortBy.quantity:
        return 'Quantity';
      default:
        return 'Name';
    }
  }

  void done() {
    print('done');
    final filter = PartFilter(
      text: controller.text.isNotEmpty ? controller.text : null,
      colors: List.from(selectedColors),
      showOwned: showOwned,
      showSpare: showSpare,
      sorting: sorting,
    );
    Navigator.of(context).pop(filter);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        done();
        return false;
      },
      child: FluidModal(
        onClose: done,
        title: Text('Filter'),
        content: SizedBox(
          width: 400,
          child: FluidTheme(
            data: FluidTheme.of(context)
                .copyWith(inputBackground: Liquids.sensitiveGrey),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FluidDropdown(
                  value: sorting,
                  items: SortBy.values
                      .map((e) => FluidMenuItem(
                            value: e,
                            child: Text(getSorting(e)),
                          ))
                      .toList(),
                  selectedItemBuilder: (sort) =>
                      Text('Sort by: ${getSorting(sort)}'),
                  isExpanded: true,
                  onChanged: (c) {
                    setState(() {
                      sorting = c;
                    });
                  },
                ),
                FluidInput(controller: controller, hintText: 'Search...'),
                FluidDropdown.multi(
                  hint: Text('Filter by Color'),
                  items: widget.colors
                      .map((e) => FluidMenuItem(
                            value: e,
                            color: e.color,
                            child: Text(e.name ?? '  '),
                          ))
                      .toList(),
                  selected: selectedColors,
                  isExpanded: true,
                  onChanged: (c) {
                    setState(() {
                      if (selectedColors.contains(c))
                        selectedColors.remove(c);
                      else
                        selectedColors.add(c);
                    });
                  },
                ),
                FluidListItem.checkbox(
                  value: showOwned,
                  title: Text('Show Completed Parts'),
                  onChanged: (v) => setState(() => showOwned = v),
                ),
                FluidListItem.checkbox(
                  value: showSpare,
                  title: Text('Show Spare Parts'),
                  onChanged: (v) => setState(() => showSpare = v),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
