import 'dart:math';

import 'package:brickr/app/models/part.dart';
import 'package:hive/hive.dart' as Hive;

class PartRepository {
  Hive.Box hive;
  Future<Hive.Box> initHive() async {
    if (hive != null) return hive;
    return hive = await Hive.Hive.openBox('parts');
  }

  Future<List<Part>> getAllParts() async {
    await initHive();
    return hive.values
        .cast<Map>()
        .map((b) => Part.fromMap(b.cast<String, dynamic>()))
        .toList();
  }

  Future<List<String>> getIDs() async {
    await initHive();
    return hive.keys.cast<String>().toList();
  }

  Future<Part> getPartByID(String id) async {
    await initHive();
    return Part.fromMap(
      Map<String, dynamic>.from(hive.get(id, defaultValue: {})),
    );
  }

  Future savePart(Part s) async {
    await initHive();
    return hive.put(s.id, s.toMap());
  }

  Future<void> addPart(Part s) async {
    await initHive();

    if (hive.containsKey(s.id)) {
      final other = hive.get(s.id);
      other['quantity'] = other['quantity'] ?? 0 + s.quantity;
    }

    final json = s.toMap();
    await hive.put(s.id, json);
  }
}
