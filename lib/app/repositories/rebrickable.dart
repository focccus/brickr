import 'package:dio/dio.dart';

import '../models/preview_set.dart';

class RebrickableAPI {
  static const KEY = 'bd68027d0f249b62877af13757213255';

  Dio dio;

  RebrickableAPI(this.dio);

  Future<List<Map>> getParts(String id) async {
    final res = await dio.get(
      'sets/$id/parts',
      queryParameters: {
        'page_size': 5000,
      },
    );

    return res.data['results'].cast<Map>() ?? [];
  }

  Future<int> getPageCount(String search, int size) async {
    try {
      final res = await dio.get(
        'sets',
        queryParameters: {
          'search': search,
          'page_size': 1,
        },
      );

      final int count = res.data['count'] ?? 0;

      return (count / size).ceil();
    } on DioError catch (err) {
      print(err);
      return 0;
    }
  }

  Future<List<LegoSet>> searchSets(int page, String search, int size) async {
    print(page);
    try {
      final res = await dio.get(
        'sets',
        queryParameters: {
          'page': page,
          'search': search,
          'page_size': size,
          'ordering': '-num_parts',
        },
      );

      final List<Map> items = res.data['results']?.cast<Map>() ?? [];

      return items.map((i) => LegoSet.fromMap(i)).toList();
    } on DioError catch (err) {
      print(err);
      return [];
    }
  }
}
