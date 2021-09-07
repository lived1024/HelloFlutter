import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("로그인 화면 표시 테스트", (WidgetTester tester) async{
    Widget form = target.loginFormApp;
    await tester.pumpWidget(form);
    
    expect(find.byKey(Key('email')), findsOneWidget);
    expect(find.byKey(Key('password')),findsOneWidget)
  });
  expect(find.widgetWithText(widgetType, text), matcher)
}