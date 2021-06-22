import 'package:flutter/widgets.dart';

void main() => runApp(NoMaterialApp());

/// widgets.dart 파일 임포트
/// Scaffold 위젯 미사용
class NoMaterialApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text('이것은 머티리얼 앱이 아닙니다.',
        textDirection: TextDirection.ltr,       // ltr : left to right 왼쪽에서 오른쪽으로
      ),
    );
  }
}