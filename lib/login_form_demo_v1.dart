import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(RowColumnDemo());

class RowColumnDemo extends StatelessWidget{

  /// TextFormField 입력값 종류
  /// TextInputType.text         : 일반 텍스트
  /// TextInputType.multiline    : 멀티 라인
  /// TextInputType.number       : 숫자
  /// TextInputType.phone        : 전화번호
  /// TextInputType.datetime     : 날짜 시간
  /// TextInputType.emailaddress : 이메일 주소
  /// TextInputType.url          : 웹을 위한 url 입력

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Login Form',
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        body : Container(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'heoro',
                child: CircleAvatar(              /// 원형 이미지 생성
                  child: Image.asset('assets/logo.jpg'),
                  backgroundColor: Colors.transparent,
                  radius: 58.0, //unit: logical pixel?,
                ),
              ),
              SizedBox(height: 45.0),   // 빈 공백을 의미하는 위젯
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: 'your_name@gmail.com',
                decoration: InputDecoration(
                  border: OutlineInputBorder()    /// border를 그려주는 클래스 : OutlineInputBorder
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                initialValue: 'input password',
                obscureText: true,                /// 입력 내용 숨기기
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0),
              Row(                                /// 로그인, 취소 버튼을 한 행에 둔다
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                  //RaisedButton(
                    child: Text('Log In'),
                    onPressed: () { } ,
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () { exit(0); },
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}