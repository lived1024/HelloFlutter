import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title : "Stateless Widget Demo",
      home : Scaffold(
        appBar : AppBar(title : Text("Stateless 위젯 데모")),
        body   : _FirstStatelessWidget(),     // StatelessWidget 사용시
      ),
    ));

// Stateless : 처음 내용을 화면에 표시할 뿐, 내용을 변경할 수 없음

class _FirstStatelessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("이것은 stateless 위젯입니다");
  }
}