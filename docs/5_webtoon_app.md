# Webtoon App

## API

Niko 가 만든 unofficial 네이버 웹툰 API 를 활용
`https://webtoon-crawler.nomadcoders.workers.dev`

 - `/today`: 오늘의 웹툰 리스트
 - `/:id`: 특정 웹툰의 정보
 - `/:id/episodes`:  특정 웹툰의 에피소드 목록

## Data Fetch by http request
- `pub.dev` 로부터 `http` 패키지 활용
- `async` 함수를 작성하여 `await` 를 이용한 `Future<Response>` 객체를 받아서 활용한다.
- `await` 를 사용하지 않는 경우 `flutter` 의 제어흐름은 request 응답을 기다리지 않고 지나쳐 버림
- `fromJson()` 를 활용해서 응답 json 데이터를 모델 클래스 객체로 변환할 수 있음

## 기타사항
- VSCode 편집기의 특정 위젯에 커서두고 왼쪽의 전구 클릭 -> `extract Method` 를 사용하면 바로 함수로 분리할 수 있음.

## Code samples

### Model class example

```dart
class WebtoonModel {
  late String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
```

### http request example

```dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  Future<List<WebtoonModel>> getTodaysToon() async {
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
```