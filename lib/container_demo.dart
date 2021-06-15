import 'package:flutter/material.dart';

void main() => runApp(ContainerDemo());

class ContainerDemo extends StatelessWidget{
  static const String _title = "Container 위젯 데모";

  /// Container 위젯은 단일 위젯만 가질 수 있다.
  /// Column 위젯은 세로 방향으로 여러 위젯을 담을 수 있다.
  ///     mainAxisAlignment는  세로 방향
  ///     crossAxisAlignment는 가로 방향
  /// Row 위젯은 가로 방향으로 여러 위젯을 담을 수 있다.
  ///     mainAxisAlignment는  가로 방향
  ///     crossAxisAlignment는 세로 방향

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title : Text(_title)),
        body : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // 컨테이너는 하나의 자식 위젯을 가진다 - child 속성에 자식 위젯 배치
              child : Text("단순 컨테이너"),
              padding : EdgeInsets.only(left : 10, top : 20, bottom : 20),
            ),
            Container(
              color: Colors.green,
              padding : EdgeInsets.symmetric(vertical : 30, horizontal: 50),
              // 컨테이너는 하나의 자식 위젯을 가진다 - child 속성에 자식 위젯 배치
              child: Container(
                color: Colors.yellow,
                // 컨테이너는 하나의 자식 위젯을 가진다 - child 속성에 자식 위젯 배치
                child: Text("중첩 컨테이너"),
              ),
            ),
          ],
        )
      ),
    );
  }
}