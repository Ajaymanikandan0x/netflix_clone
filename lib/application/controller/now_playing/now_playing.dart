import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/now_playing/now_playing.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=aa478cfb0cff1df92ea8317cd52813e2';

final dio = Dio();
Future<List<NowPlaying>> getAllNowPlaying() async {
  int maxRetries = 3;
  while (maxRetries > 0) {
    try {
      final response = await dio.get(getUrl);
      if (response.statusCode == 200) {
        final bodyAsJson = response.data as Map<String, dynamic>;
        final data = NowPlayingList.fromJson(bodyAsJson['results']);
        if (kDebugMode) {
          print(data.nowPlayingList[0].overview);
        }
        return data.nowPlayingList;
      } else {
        maxRetries--;
      }
    } catch (e) {
      maxRetries--;
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
  return [];
}
