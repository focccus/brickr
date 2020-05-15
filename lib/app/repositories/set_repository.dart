import 'dart:math';

import 'package:brickr/app/models/preview_set.dart';
import 'package:hive/hive.dart' as Hive;

class SetRepository {
  Hive.Box hive;
  Future<Hive.Box> initHive() async {
    if (hive != null) return hive;
    return hive = await Hive.Hive.openBox('sets');
  }

  Future<List<LegoSet>> getAllSets() async {
    await initHive();
    return hive.values
        .cast<Map>()
        .map((b) => LegoSet.fromMap(b.cast<String, dynamic>()))
        .toList();
  }

  Future<LegoSet> getSetByID(String id) async {
    await initHive();
    return LegoSet.fromMap(hive.get(id)?.cast<String, dynamic>());
  }

  Future<bool> hasSet(String id) async {
    await initHive();
    return hive.containsKey(id);
  }

  Future saveSet(LegoSet s) async {
    await initHive();
    return hive.put(s.id, s.toMap());
  }

  Future deleteSet(String id) async {
    await initHive();
    return hive.delete(id);
  }

  Future<void> addNewSet(LegoSet s) async {
    await initHive();
    final json = s.toMap();
    await hive.put(s.id, json);
  }
}
