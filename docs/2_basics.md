# Hello flutter

## 각종 개념 정리

- flutter 기본 UI
  - 여러 위젯을 계층구조로 쌓아 붙이면서 화면을 구성하게 됨.
  - 디자인 시스템
    - `MaterialApp`: ios 스타일의 UI
    - `CupertinoApp`: 구글 스타일의 UI. customizing 에 강함. 추천
- 개발 환경
  - Visual Studio Code 에 Dart, Flutter plug-in 을 깔아서 쓰면 됨.
  - 자동완성, 디버깅, Simulator 까지 완 to the 벽
  - Widget 을 계층으로 구성할때 argument 를 넣고 맨 끝에 `,` 를 붙여주면 코드가 예쁘게 포매팅된다. 
- Widget
  - 레고블럭이라고 생각하면 됨.
  - [플러터 위젯 카탈로그](https://flutter-ko.dev/docs/reference/widgets)를 보면 다양한 공식/커뮤니티 위젯 을 제공함.
  - 위젯이 필요하면 검색해서 가져다가 쓰면 됨.
  - 위젯 하나 당 클래스 하나
- 패키지 관리 시스템
  - `pub.dev`: Dart, Flutter 를 위한 공식 패키지 등을 모아둔 저장소 (node 의 npm, 파이썬의 pip 같은 느낌)
  - `pubspec.yaml` : 프로젝트의 패키지 의존성을 관리하는 파일
  - 유용한 패키지: http


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
- Widget key
  - Flutter 가 위젯마다 고유값을 지정하여 좀 더 편하게 관리 할 수 있도록 ID 를 부여해달라는 경고가 뜸
  - VSCode 편집기에서 클래스 명에 커서를 놓고 `Quick fix` 를 쓰면 쉽게 추가 가능


## 유용한 dart package

- `http`: HTTP Request Client
- `url_launcher`: URL, 이메일, 연락처 등의 정보를 입력받아 그에 해당하는 적절한 액션을 연결해줌
- `shared_preferences`: 데이터를 로컬 디바이스에 저장하여 관리할 수 있도록 도와주는 기능 제공
