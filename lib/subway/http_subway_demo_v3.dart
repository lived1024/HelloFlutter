import 'package:flutter/material.dart';
import 'page_subway_info.dart';         // http_subway_main 파일과 차이점은 요것

void main() => runApp(SubwayDemo());

class SubwayDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}