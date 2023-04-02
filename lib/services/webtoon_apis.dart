import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';

class WebtoonApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<WebtoonModel>> getTodaysToon() async {
    List<WebtoonModel> webtoonInstances = [];
    Uri url = Uri.parse('$baseUrl/today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var webtoonModel = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(webtoonModel);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtoonById(String id) async {
    Uri url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return WebtoonDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisode>> getWebtoonEpisodesById(String id) async {
    List<WebtoonEpisode> webtoonEpisodeInstances = [];
    Uri url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        var episodeModel = WebtoonEpisode.fromJson(episode);
        webtoonEpisodeInstances.add(episodeModel);
      }
      return webtoonEpisodeInstances;
    }
    throw Error();
  }
}
