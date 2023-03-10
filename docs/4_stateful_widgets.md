# Stateful Widgets

## 주요 개념
- Stateful Widget 이란? 위젯이 특정한 상태정보(=state)를 보유하고 있어서 그 정보가 바뀌면 자신의 화면상 UI에도 그 변경사항을 반영해야 하는 위젯. (= data watch 기능이 들어간 위젯)
- State 란?
  - Data, Dart property.
  - Flutter 기능 아님
- BuildContext
  - 모든 상위(=부모) 위젯 Tree 에서 특정 위젯의 위치로 액세스 할 수 있음
  - 모든 상위 위젯의 State(=data) 에 접근할 수 있음

## 기타 정보
- `initState()`
  - 위젯 상태 초기화용 함수
  - 대부분의 경우 이 함수 작성할 필요 없음
  - `build()` 보다 먼저 실행되어야 함.
  - `super.initState()` 가 먼저 실행되어야 함.
  - 1회만 실행됨
- `setState()`
  - UI 상에 반영이 필요한 State 상의 변경이 있었다는것을 플러터에게 알려주는 함수.
  - flutter 는 App의 `build()` 메서드를 다시 실행하여 UI를 새로 그린다.
  - 원하는 시점에 이 함수를 실행시킴으로써 UI 갱신을 효과적으로 할 수 있음
- `dispose()`
  - 위젯이 UI(=widget tree) 에서 삭제되기 직전 트리거 되는 함수.
  - 사라지는 UI 애니메이션 처리, 데이터 정리 및 초기화, API 호출 등의 목적에 사용됨.
  - `super.dispose()` 가 가장 늦게 실행되어야 함.
- Theme
  - App 의 각종 스타일 기본값을 지정할 수 있음
- nullable 에 대한 경고가 뜰때 강제로 없애기
  - `!` 를 변수뒤에 붙여주면 `이 변수는 반드시 null 이 아님` 을 주장하는 것
  - `?` 와 반대되는 개념이라고 생각
- `widget` 변수를 이용하여 위젯 초기화 데이터를 State 클래스에서 접근할 수 있다.