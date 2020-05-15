import 'dart:convert';

import 'package:brickr/app/models/color.dart';

class Part {
  String id;
  String name;
  String img;
  double length;
  LegoColor color;
  int quantity;
  int owned;

  Part({
    this.id,
    this.name,
    this.img,
    this.length,
    this.color,
    this.quantity,
    this.owned,
  });

  String getPreview({int size = 100}) {
    return img.replaceFirst('media/parts', 'media/thumbs/parts') +
        '/${size}x$size.jpg';
  }

  Part copyWith({
    String id,
    String name,
    String img,
    double length,
    LegoColor color,
    int quantity,
    int owned,
  }) {
    return Part(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
      length: length ?? this.length,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      owned: owned ?? this.owned,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'part_num': id,
      'name': name,
      'part_img_url': img,
      'length': length,
      'color': color.toMap(),
      'quantity': quantity,
      'owned': owned,
    };
  }

  static Part fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final p = map['part'] ?? map;
    final c = map['color'] ?? map;

    String name = p['name'];
    double length = p['length'];

    if (length == null && name != null) {
      RegExp reg;
      if (name.contains("Axle")) reg = RegExp(r'Axle \1(\d+(\.\d)*)');
      if (name.contains("1 x")) reg = RegExp(r'Beam 1 x \1(\d+(\.\d)*)');
      if (reg != null) {
        var matches = reg.allMatches(name).toList();
        double nu =
            matches.isNotEmpty ? double.tryParse(matches[0].group(1)) : null;
        if (nu != null && nu > 2) length = nu;
      }
    }

    return Part(
      id: p['part_num'],
      name: name,
      img: p['part_img_url'],
      length: length,
      color: LegoColor.fromMap(Map.from(c)),
      quantity: map['quantity'],
      owned: map['owned'],
    );
  }

  String toJson() => json.encode(toMap());

  static Part fromJson(String source) => fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Part &&
        o.id == id &&
        o.name == name &&
        o.img == img &&
        o.length == length &&
        o.color == color &&
        o.quantity == quantity &&
        o.owned == owned;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        img.hashCode ^
        length.hashCode ^
        color.hashCode ^
        quantity.hashCode ^
        owned.hashCode;
  }

  @override
  String toString() {
    return 'Part(id: $id, name: $name, img: $img, length: $length, color: $color, quantity: $quantity, owned: $owned)';
  }
}

class SetPart {
  String id;
  int quantity;
  int owned;
  Part part;
  SetPart({
    this.id,
    this.quantity,
    this.owned,
    this.part,
  });

  SetPart copyWith({
    String id,
    int quantity,
    int owned,
    Part part,
  }) {
    return SetPart(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      owned: owned ?? this.owned,
      part: part ?? this.part,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'part_num': id,
      'quantity': quantity,
      'owned': owned,
    };
  }

  static SetPart fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SetPart(
      id: map['part_num'] ?? map['part']['part_num'],
      quantity: map['quantity'],
      owned: map['owned'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  static SetPart fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'SetPart(id: $id, quantity: $quantity, owned: $owned)';
  }

  String toCsv() => "$id,${part.name},$quantity,$owned";

  String toText({int mode}) {
    var res = "${part.name} ($id) - ";
    switch (mode) {
      case 1:
        res += owned.toString();
        break;
      case 2:
        res += (quantity - owned).toString();
        break;
      default:
        res += quantity.toString();
    }
    return res;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SetPart &&
        o.id == id &&
        o.quantity == quantity &&
        o.owned == owned;
  }

  @override
  int get hashCode {
    return id.hashCode ^ quantity.hashCode ^ owned.hashCode;
  }
}
