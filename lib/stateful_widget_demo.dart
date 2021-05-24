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
  @override
  State createState() => _FirstStatefulWidgetState();
}

// 변동부
class _FirstStatefulWidgetState extends State<_FirstStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Text("이것은 stateful 위젯입니다");
  }
}