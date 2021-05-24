import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title : "Hello Flutter",
      home : Scaffold(
        appBar : AppBar(title : Text("Hello Flutter")),
        body : Text("Hello Flutter"),
      ),
    ));


/* 플러터 콘솔 실행 방법
 * 프로젝트가 있는 폴더로 이동하여 다음 명령 실행
 * flutter run lib/simple_app.dart
 * 안드로이드 스튜디오에서 실행했던것과 동일하게 실행된다.
 */