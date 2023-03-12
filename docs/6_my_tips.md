# 내가 수집한 기타 Tips

### 화면크기에 상대적으로 fontSize 정하기

Flutter에서 Text 위젯의 fontSize를 화면 크기에 상대적인 방식으로 설정하는 방법은 다음과 같습니다.

1. 미디어 쿼리(MediaQuery)를 사용하여 현재 화면의 가로 길이를 가져옵니다.
```dart
final screenWidth = MediaQuery.of(context).size.width;
```

2. screenwidth 값을 기반으로 폰트 크기를 계산합니다.

```dart
final fontsize = screentidth* 0.05; 11 폰트 크기를 가로 길이의 5%로 설정
```

3. Text 위젯의 style 속성에 fontSize 값을 설정합니다.
```dart
Text
style: TextStyle(
fontSize: fontSize,
)
```

위와 같이 설정하면, 화면의 가로 길이에 따라 fontSize가 상대적으로 조정되므로 다양한 화면 크기에서 일관된 디자인을 유지할 수 있습니다.


### 왜 Stateless widget > Stateful widget 인가?

Flutter에서 stateless widget stateful widget보다 더 많이 사용하는 것에는 몇 가지 이점이 있습니다.

1. 성능 개선: stateless widget은 상태를 저장하지 않기 때문에 build() 메소드가 호출될 때마다 항상 동일한 결과를 반환합니다. 이로 인해 Flutter는 상태가 변경되었을 때 위젯을 다시 그리지 않아도 되 므로 성능이 향상됩니다.
2. 코드 간결성: statelesswidget은 상태 관리를 위한 코드가 필요하지 않으므로 코드가 더욱 간결해집 니다. 이는 프로젝트 규모가 커질수록 유지 보수성을 높이는 데 도움이 됩니다.
3. 테스트 용이성: stateless widget은 동일한 입력에 대해 항상 동일한 출력을 반환하기 때문에 테스트 하기가 더욱 쉽습니다. 이는 코드 품질을 높이는 데 도움이 됩니다.

하지만 모든 상황에서 stateless widget을 사용하는 것이 항상 최선인 것은 아닙니다. 예를 들어, 사용자 입력에 응답하여 상태를 변경해야 하는 경우 stateful widget을 사용해야 합니다. 따라서 상황에 따라 적 절한 위젯을 선택하는 것이 중요합니다.


### API 호출을 통한 data fetch 시점

- 일반적인경우 위젯 클래스 바로 안쪽에서 함수 호출
- data fetch 함수 호출 시, 위젯의 initialize 시점에 넘어오는 argument 가 필요하다면 위젯을 StatefulWidget 으로 바꾸고 `initState()` 안쪽에서 함수를 호출

```dart
// 일반적인 경우
class WebtoonHomeScreen extends StatelessWidget {
  WebtoonHomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToon();
}

// -------------------------------------------------
// 클래스 
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    required this.title,
    required this.thumb,
    required this.id,
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final String userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisode>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getWebtoonById(widget.id);
    episodes = ApiService.getWebtoonEpisodesById(widget.id);
  }
}
```