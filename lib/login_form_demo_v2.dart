import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';  // 상태관리를 위해 import가 필요하다
import 'page_main.dart';
import 'state_simple.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => SimpleState(), // 참고서엔 build를 이용했지만 현재는 변경됐다.
    child: StateLoginDemo(),
  )
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