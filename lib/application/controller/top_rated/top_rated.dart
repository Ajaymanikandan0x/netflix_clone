import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/top_rated/top_rated.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=aa478cfb0cff1df92ea8317cd52813e2';
final dio = Dio();

Future<List<TopRated>> getTopRatedMovies() async {
  int count = 3;

  while (count > 0) {
    try {
      if (kDebugMode) {
        print('Attempting to fetch data...');
      }

      final response = await dio.get(getUrl);

      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        final bodyAsJson = response.data as Map<String, dynamic>;
        final data = TopRatedList.fromJson(bodyAsJson['results']);

        if (kDebugMode) {
          print('First movie overview: ${data.topRatedList[0].overview}');
        }

        return data.topRatedList;
      } else {
        count--;
        if (kDebugMode) {
          print('Request failed, retries left: $count');
        }
      }
    } catch (e) {
      count--;
      if (kDebugMode) {
        print('Error: $e, retries left: $count');
      }
    }
  }

  return [];
}
