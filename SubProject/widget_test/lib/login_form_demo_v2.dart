import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_test/page_main.dart';

import 'page_login.dart';  // 상태관리를 위해 import가 필요하다
import 'state_simple.dart';

/// provider 패키지
/// ChangeNotifierProvider    - 단일 모델 제공
/// MultiProvider             - 다수의 모델 클래스 지정 시 사용
/// Provider                  - 지정한 모델에 접근하여 모델에 값을 갱신할 수 있게 해줌
/// Consumer                  - Provider 클래스에 제공되는 모델 클래스를 읽어온다.
void main() => runApp(loginFormApp);

var loginFormApp = ChangeNotifierProvider(
  create: (context) => SimpleState(),
  child: StateLoginDemo(),
);

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class StateLoginDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그인 폼',
      debugShowCheckedModeBanner: false,
      initialRoute: ROOT_PAGE,
      routes: {
        ROOT_PAGE : (context) => LoginPage(),
        MAIN_PAGE : (context) => MainPage(),
      },
    );
  }
}