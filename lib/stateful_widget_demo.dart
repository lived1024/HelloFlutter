import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title : "Stateful Widget Demo",
      home : Scaffold(
        appBar : AppBar(title : Text("Stateful 위젯 데모")),
        body   : _FirstStatefulWidget(),    // StatefulWidget 사용시
      ),
    ));

// Stateful  : 버튼을 누르거나 터치했을 때, 화면에 변경된 내용을 표시할 수 있음
// Flutter는 최대한 고정부와 변동부를 구별하도록 설계

// 고정부
class _FirstStatefulWidget extends StatefulWidget{

  // 상태를 생성. 이 메서드를 제외하고 나머지는 모두 State 클래스에 있음.
  @override
  State createState() => _FirstStatefulWidgetState();
}

// 변동부
class _FirstStatefulWidgetState extends State<_FirstStatefulWidget>{

  String _buttonState = "";

  /* 여기서부터 생명주기 순서 정렬
   * build()는 필수적으로 오버라이드 해야함.
   */

  @override
  void initState() {
    // 상태 초기화
    super.initState();
    print('initState(): 기본값을 설정합니다');
    _buttonState = 'OFF';
  }

  @override
  void didChangeDependencies() {
    // 상태 객체의 의존성이 변경되면 호출
    print('didChangeDependencies() 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    // 위젯을 화면에 표시. 표시할 위젯을 return시킨다.
    print('build() 호출됨');
    return Column(
      children: <Widget>[
        //RaisedButton(      // 참고 서적에서는 RaisedButton이지만 ElevatedButton으로 변경되었다.
        ElevatedButton(
          child: Text('버튼을 누르세요'),
          onPressed: _onClick,
        ),
        Row(
          children: <Widget>[
            Text('버튼 상태 : '),
            Text(_buttonState),
          ],
        )
      ],
    );
  }

  void _onClick(){
    print('_onClick() 호출됨');
    // 별도로 setState를 구현했다면
    // 여기의 setState()가 작동하지 않는다.
    // setState는 외부에 작성하지 않고, 해당되는 이벤트의 내부에서만 쓰는걸 추천
    setState(() {
      print('setState() 호출됨');
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  void didUpdateWidget(_FirstStatefulWidget oldWidget) {
    // 위젯의 설정이 변경될 때 호출
    print('didUpdateWidget() 호출됨');
  }

  // @override
  // void setState(VoidCallback fn) {
  //   // 위젯의 상태를 갱신 ( 화면을 갱신할 때 호출 )
  //   // 위젯을 처음부터 다시 만들지만 initState() 메서드는 호출되지 않음
  //   // 인자로 넘기는 fn 함수에 변경하기 원하는 내용 넣음
  //   // 실제 사용은 _onClick() 메서드에서 사용하는 방식 참고,,
  //   //
  //   /* 해당 위치에 오버라이드로 함수를 구현했다면,
  //    * 컴포넌트의 이벤트에서 별도로 setState라는 함수를 작성하더라도
  //    * 오버라이드를 구현한 메소드인 여기를 실행하게 된다.
  //   */
  //   // 여기 메소드를 주석 풀고 실행하면,
  //   // 이벤트 내부에서 선언과 동시에 실행한 setState 함수가 작동하지 않고
  //   // 아래의 'overrided setState() 호출'이 출력되는 모습을 확인할 수 있다.
  //   print('overrided setState() 호출');
  // }

  @override
  void deactivate() {
    // 상태 객체가 위젯 트리에서 제거 => 경우에 따라 재사용 가능
    print('deactivate() 호출됨');
  }

  @override
  void dispose() {
    // 상태 객체가 위젯 트리에서 완전히 제거 => 수행 시 위젯 재사용 불가
    print('dispose() 호출됨');
  }

  @override
  void reassemble() {
    // hot reload 실행 시 호출
  }
}