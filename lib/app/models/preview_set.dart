import 'dart:convert';

import 'package:brickr/app/models/part.dart';
import 'package:flutter/foundation.dart';

class LegoSet {
  String id;
  String name;
  int year;
  String img = "";
  int numparts;
  List<SetPart> parts;
  List<SetPart> spareparts;
  LegoSet({
    this.id,
    this.name,
    this.year,
    this.img,
    this.numparts,
    this.parts,
    this.spareparts,
  });

  String getPreview(
      {int size = 100,
      String url = "https://cdn.rebrickable.com/media/thumbs/sets/"}) {
    return url + id + '.jpg/${size}x$size.jpg';
  }

  LegoSet copyWith({
    String id,
    String name,
    int year,
    String img,
    int numparts,
    List<SetPart> parts,
    List<SetPart> spareparts,
  }) {
    return LegoSet(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      img: img ?? this.img,
      numparts: numparts ?? this.numparts,
      parts: parts ?? this.parts,
      spareparts: spareparts ?? this.spareparts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'set_num': id,
      'name': name,
      'year': year,
      'set_img_url': img,
      'num_parts': numparts,
      'parts': List<dynamic>.from(parts.map((x) => x.toMap())),
      'spareparts': List<dynamic>.from(spareparts.map((x) => x.toMap())),
    };
  }

  static LegoSet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LegoSet(
      id: map['set_num'],
      name: map['name'],
      year: map['year'],
      img: map['set_img_url'],
      numparts: map['num_parts'],
      parts: List<SetPart>.from(
        map['parts']
                ?.map((x) => SetPart.fromMap(Map<String, dynamic>.from(x))) ??
            [],
      ),
      spareparts: List<SetPart>.from(
        map['spareparts']
                ?.map((x) => SetPart.fromMap(Map<String, dynamic>.from(x))) ??
            [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  static LegoSet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'LegoSet(id: $id, name: $name, year: $year, img: $img, numparts: $numparts, parts: $parts, spareparts: $spareparts)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LegoSet &&
        o.id == id &&
        o.name == name &&
        o.year == year &&
        o.img == img &&
        o.numparts == numparts &&
        listEquals(o.parts, parts) &&
        listEquals(o.spareparts, spareparts);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        year.hashCode ^
        img.hashCode ^
        numparts.hashCode ^
        parts.hashCode ^
        spareparts.hashCode;
  }
}
