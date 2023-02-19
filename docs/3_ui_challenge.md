# UI Challenge

## Visual Studio Code 제대로 활용하기


### 유용한 설정

- Dart + Flutter 개발 시, 유용한 Visual Studio Setting
- `Cmd + P` -> `settings.json` 검색
- 설정 편집기에서 아래 내용 추가

```json
{
  "editor.codeActionsOnSave": {
      "source.fixAll": true
  },
  "dart.previewFlutterUiGuides": true
}
```

### 기타 꿀팁

- Code Actions 활성화 하기
  - 특정 위젯위에 커서를 두면 왼쪽에 노란 전구가 뜬다.
  - 이게 코드작업표시(Code Actions)라고 하는데 이 전구를 클릭해서 제공된느 숏컷들을 활용하면
  - 특정 위젯으로 랩핑하거나, 랩핑된 위젯을 제거할때 편하다.
- 플러그인
  - `Error lens` by Alexander 설치

## Widgets
- Scaffold: 화면 틀잡기
- Column: 세로 영역
- SizedBox: "빈" 박스 영역
- Row: 가로 영역
- Padding: 테두리 안쪽영역
- Container: 박스영역 (html의 div)

## Attribute values

- 색상
  - `Colors.white`
  - `Color(0xff181818)`
  - `Colors.white.withOpacity(0.8)`
- 정렬
  - 현재 widget 과 정방향 (Column 일때는 세로, Row 일때는 가로): `MainAxisAlignment.center`
  - 현재 widget 정방향에 대하여 수직 (Column 일때 가로): `CrossAxisAlignmen t.end`