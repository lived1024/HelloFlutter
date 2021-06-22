import 'package:flutter/material.dart';

void main() => runApp(MyMaterialApp());

/// Scaffold 위젯 미사용
class MyMaterialApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머티리얼 앱',
      home: Container(
        padding: EdgeInsets.all(20),
        child: Text('이제는 머티리얼 앱입니다'),
      ),
    );
  }
}