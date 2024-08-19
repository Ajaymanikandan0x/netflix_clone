import 'package:dio/dio.dart';

import '../../model/videos/videos.dart';

String getUrl =
    'https://gist.githubusercontent.com/poudyalanil/1685db9c4f17c68d5cb9ffaa3f59e3a6/raw/8cadc7e7bd1a3d4b810b50be0c08a86b224de128/live-videos.json';
final dio = Dio();
Future<List<Videos>> getVideos() async {
  final response = await dio.get(getUrl);
  final bodyAsJson = response.data as List<dynamic>;
  final data = bodyAsJson.map((data) => Videos.fromJson(data)).toList();
  return data;
}
