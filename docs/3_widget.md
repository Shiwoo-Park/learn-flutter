# Widgets

## Widget 간단 소개
- Scaffold: 화면 틀잡기
- Column: 세로 영역
- SizedBox: "빈" 박스 영역
- Center: 내부 child 위젯을 가운데에 위치시키는 영역
- Row: 가로 영역
- Padding: 테두리 안쪽영역
- Container: 박스영역 (html의 div)
- Flexible: 박스영역인데 화면을 차지하는 비율을 지정할 수 있음
- Expanded: 박스가 차지하는 영역을 확장해서 전체로 넓힘
- FutureBuilder: API Call 등의 이유로 Future 객체를 리턴하는 함수를 실행시킨 뒤 어떤 UI 액션을 필요로할때 사용
- CircularProgressIndicator: 동그라미 로딩 아이콘
- ListView: 여러개의 동일한 위젯을 렌더링 해야할때 사용 (한정된 적은 수량일때만 사용)
- ListView.builder, ListView.separated: 여러개의 동일한 위젯을 동적으로 렌더링+삭제 하며 표시 (대량 데이터에 활용, like paging)
- GestureDetector: 유저로부터 입력되는 각종 UI 액션에 대한 event 를 붙이고 싶을때 사용
- Navigator: 화면 전환 시 사용
- Hero: 화면이 전환될때 각 화면의 동일한 widget을 wrap 하여 같은 tag를 붙여주면 자연스럽게 해당 요소를 애니메이션 걸어줌

## Widget 활용 실제 코드

### FutureBuilder

webtoon 정보들을 불러온 이후 위젯 랜더링을 할 수 있다.

```dart
Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToon();

FutureBuilder(
  future: webtoons,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return const Text("There is data!");
    } else {
      return const Text("Loading");
    }
  },
)
```

### 효율적인 ListView

- 데이터 량이 아주 많은 경우 최적화를 위해서 사용한다.
- 한정된 소량의 데이터를 표현하는 경우는 그냥 Row, Column 등을 활용해도 괜찮음

```dart
ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    print(index);
    var webtoon = snapshot.data![index];
    return Text(webtoon.title);
  },
);

ListView.separated(
  scrollDirection: Axis.horizontal,
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    print(index);
    var webtoon = snapshot.data![index];
    return Text(webtoon.title);
  },
  separatorBuilder: (context, index) => const SizedBox(
    width: 20,
  ),
);
```

## Attribute values

- 색상
  - `Colors.white`
  - `Color(0xff181818)`
  - `Colors.white.withOpacity(0.8)`
- 정렬
  - 현재 widget 과 정방향 (Column 일때는 세로, Row 일때는 가로): `MainAxisAlignment.center`
  - 현재 widget 정방향에 대하여 수직 (Column 일때 가로): `CrossAxisAlignmen t.end`