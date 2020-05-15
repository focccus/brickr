import 'package:flutter/foundation.dart';

import 'package:brickr/app/models/color.dart';
import 'package:brickr/app/models/part.dart';

class PartFilter {
  final String text;

  final List<LegoColor> colors;

  final SortBy sorting;

  final bool showSpare;
  final bool showOwned;
  PartFilter({
    this.text,
    this.colors = const [],
    this.showSpare = false,
    this.showOwned = true,
    this.sorting = SortBy.color,
  });

  int sort(Part p1, Part p2) {
    switch (sorting) {
      case SortBy.color:
        {
          if (p2?.color?.value == null) return 1;
          return p1?.color?.value?.compareTo(p2.color.value) ?? -1;
        }
      case SortBy.length:
        {
          if (p2?.length == null) return 1;
          return p1?.length?.compareTo(p2.length) ?? -1;
        }
      case SortBy.quantity:
        return p1.quantity.compareTo(p2.quantity);
      default:
        return p1.name.compareTo(p2.name);
    }
  }

  bool filter(Part p) {
    if (text != null && !p.name.toLowerCase().contains(text.toLowerCase()))
      return false;

    if (colors.isNotEmpty && p.color != null && !colors.contains(p.color))
      return false;

    return true;
  }

  PartFilter copyWith({
    String text,
    List<LegoColor> colors,
    SortBy sorting,
    bool showSpare,
    bool showOwned,
  }) {
    return PartFilter(
      text: text ?? this.text,
      colors: colors ?? this.colors,
      sorting: sorting ?? this.sorting,
      showSpare: showSpare ?? this.showSpare,
      showOwned: showOwned ?? this.showOwned,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PartFilter &&
        o.text == text &&
        listEquals(o.colors, colors) &&
        o.sorting == sorting &&
        o.showSpare == showSpare &&
        o.showOwned == showOwned;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        colors.hashCode ^
        sorting.hashCode ^
        showSpare.hashCode ^
        showOwned.hashCode;
  }

  @override
  String toString() {
    return 'PartFilter(text: $text, colors: $colors, showSpare: $showSpare, showOwned: $showOwned)';
  }
}

enum SortBy {
  name,
  quantity,
  color,
  length,
}

SortBy sortByFromString(String s) {
  switch (s) {
    case 'SortBy.name':
      return SortBy.name;
    case 'SortBy.quantity':
      return SortBy.quantity;
    case 'SortBy.length':
      return SortBy.length;
    default:
      return SortBy.color;
  }
}
