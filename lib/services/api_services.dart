import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';

class ApiService {
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
}
