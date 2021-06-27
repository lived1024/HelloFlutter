import 'package:flutter/material.dart';

void main() => runApp(NavigatorRoutesDemo());

class NavigatorRoutesDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',                  /// 앱이 시작할 때 첫 경로
      routes: {
        /// 경로 : (context) => 실행될 실제 화면 위젯
        /// 경로는 웹의 url과 같은 방식을 채택
        '/' : (context) => MainPage(),
        '/next' : (context) => NextPage(),
      },
    );
    
    /// routes 구성을 아래와같이 구성하는 것을 권장한다.
    /// '/'               메인 목록 화면
    /// '/detail'         개별 아이템의 상세 화면
    /// '/edit'           개별 아이템의 편집 화면
    /// '/settings'       설정 화면
    /// '/about'          앱 정보 화면
  }
}

class MainPage extends StatelessWidget{
  /// pushNamed를 이용하여 routes에서 설정한 키값(경로)을 이용할 수 있다.
  _showNextPage(BuildContext context) => Navigator.pushNamed(context, '/next');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Routes 데모'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showNextPage(context),
          child: Text('상세 페이지로 이동'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget{
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
          child: Text('메인 페이지로 돌아가기'),
        ),
      ),
    );
  }
}