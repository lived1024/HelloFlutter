import 'package:flutter/material.dart';

void main() => runApp(MaterialScaffoldApp());

/// 정상적인 앱의 형태를 가진다.
/// 화면 표시에 대한 역할은 Scaffold 위젯이 담당
class MaterialScaffoldApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머티리얼 앱',
      home: Scaffold(
        appBar: AppBar(title: Text('진짜 머티리얼 앱')),
        body: Text('이제야 제대로 된 머티리얼 앱입니다.'),
      ),
    );
  }
}