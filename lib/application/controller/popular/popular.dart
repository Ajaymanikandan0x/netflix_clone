import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/popular/popular.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=aa478cfb0cff1df92ea8317cd52813e2';

final dio = Dio();

Future<List<Popular>> getAllPopular() async {
  int c = 3;
  while (c > 0) {
    try {
      final response = await dio.get(getUrl);
      if (response.statusCode == 200) {
        final bodyAsJson = response.data as Map<String, dynamic>;
        final data = PopularList.fromJson(bodyAsJson['results']);
        if (kDebugMode) {
          print(data.popularList[0].overview);
        }
        return data.popularList;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    c--;
  }
  return [];
}
