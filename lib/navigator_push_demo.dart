import 'package:flutter/material.dart';

void main() => runApp(NavigatorPushDemo());

/// Navigator를 이용해 화면 전환
/// 이동할 때 : push()
/// 돌아올 때 : pop()
///
class NavigatorPushDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  // _showNextPage 실행 시 NextPage 클래스 화면으로 전환
  // MaterialPageRoute 클래스는 머티리얼 앱의 룩앤필에 맞는 화면 전환을 해준다.
  _showNextPage(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 기본 데모'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showNextPage(context),
          child: Text('다음 화면으로 이동'),
        )
      ),
    );
  }
}

/// 독립적인 화면 -> Scaffold 위젯으로 시작
class NextPage extends StatelessWidget{
  // _backToMainPage 실행 시 MainPage 클래스 화면으로 돌아감
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다음 페이지'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _backToMainPage(context),
          child: Text('돌아가기'),
        ),
      ),
    );
  }
}