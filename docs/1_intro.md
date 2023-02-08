# Introduction

- Web / Desktop / Mobile App, IoT 등 Cross-platform 을 지원

### Why flutter?

- 하나의 언어 + 프레임워크를 가지고 많은 것들을 만들 수 있음
- 구글이 자체 앱을 flutter 로 만들어 내기 시작하면서 쉽게 버릴것 같은 분위기가 아님.
- 세계의 대기업에서 flutter 를 사용하기 시작함.
- 웹앱을 만들어도 html, css 등을 전혀 쓸 필요가 없음.
- 게임 제작도 가능

### Sample Apps

- `FLOKK` : 크로스 플랫폼 예시
- `Wonderous` 라는 앱이 굉장히 아름다운데 flutter 로 만들었음
- `flutterplasma`: 애니메이션 예시
- `pinball.flutter.dev`

### How flutter works

- flutter를 사용하면 각 플랫폼의 네이티브 UI는 사용불가 (built-in platform widget 사용불가)
- 각 플랫폼의 OS와 직접적으로 소통하지 않음.
- flutter 엔진
  - C/C++ 로 만들어짐
  - flutter 의 Dart 코드를 동작(=컴파일)시켜줌
  - 프레임워크를 동작시키고 화면을 렌더링(=페인팅)함.
  - 각 플랫폼 OS 는 flutter엔진을 단순히 "구동" 만 해줌.
- flutter UI
  - 그냥 캔버스위에 임의로 "그려진" 것들임
  - 각 플랫폼에서 제공되는 "원조 UI" 가 아닌 가짜임
  - 아이폰의 UI 를 따라해보려고 했으나 잘 안됨, 비슷하게는 됨.
  - 아이폰 비슷한 스타일의 UI 를 Cupertino 라고 함.
  - 모든 플랫폼에서 정확히 똑같이 보임.

### Flutter VS React Native

- flutter
  - 자체적으로 보유한 캔버스에서 모든 픽셀을 직접 컨트롤
  - `게임 엔진과 비슷`함.
  - 캔버스위에 임의로 "그려준" UI를 사용.
  - 모든 OS 에서 동일한 형태로 보여짐
- React Native
  - 각 플랫폼 OS 와 직접 "소통"을 하여 앱을 제작함.
  - 즉, 같은 기능이어도 플랫폼별로 다르게 보일 수 있음
- 어떻게 선택하면 되나요?
  - OS native widget 을 "사용해야만 한다" 면 React Native 를 사용하면 됨.
  - 모든점에 대해서 커스터마이징 된 UI제작 그리고 그것들 통일된 방식으로 모든 플랫폼에 공급하는 App 을 만들고 싶다면 flutter 를 그냥 선택하면 됨.
- 내 생각
  - 솔직히 말해서 굳이 OS native 위젯 죽어도 쓰겟답시고 크로스 플랫폼을 포기할 이유가 없음... 그리고 RN은 유지보수도 앞으로 불안함
  - 결론: React Native 는 flutter의 비교 상대가 안됨
