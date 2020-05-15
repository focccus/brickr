import 'dart:convert';

import 'package:flutter/painting.dart';

class LegoColor {
  String name;

  String hex;
  LegoColor({
    this.name,
    this.hex,
  });

  int get value => int.parse('ff' + hex, radix: 16);

  Color get color => Color(value);

  LegoColor copyWith({
    String name,
    String hex,
  }) {
    return LegoColor(
      name: name ?? this.name,
      hex: hex ?? this.hex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hex': hex,
    };
  }

  static LegoColor fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LegoColor(
      name: map['name'],
      hex: map['hex'] ?? map['rgb'],
    );
  }

  String toJson() => json.encode(toMap());

  static LegoColor fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'LegoColor(name: $name, hex: $hex)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LegoColor && o.name == name && o.hex == hex;
  }

  @override
  int get hashCode => name.hashCode ^ hex.hashCode;
}
