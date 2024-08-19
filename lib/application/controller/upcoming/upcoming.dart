import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/upcoming/upcoming.dart';

const url =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=aa478cfb0cff1df92ea8317cd52813e2';
final dio = Dio();

Future<List<Upcoming>> getAllUpcoming() async {
  int count = 3;
  while (count > 0) {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final bodyAsResponse = response.data as Map<String, dynamic>;
        final result = UpcomingList.fromJson(bodyAsResponse['results']);
        if (kDebugMode) {
          print(result.upcomingList[0].imagePath);
        }
        return result.upcomingList;
      } else {
        count--;
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
