import 'package:hive/hive.dart' as Hive;

class OptionsRepository {
  Hive.Box hive;
  Future<Hive.Box> initHive() async {
    if (hive != null) return hive;
    hive = await Hive.Hive.openBox('options');

    return hive;
  }

  Future getOption(String id) async {
    await initHive();
    return hive.get(id);
  }

  Future saveOption(String id, value) async {
    await initHive();
    return hive.put(id, value);
  }
}
