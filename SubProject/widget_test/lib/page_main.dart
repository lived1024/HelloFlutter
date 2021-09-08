import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_test/state_simple.dart';

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Consumer로 값을 전달받기 원하는 모델 지정
        child: Consumer<SimpleState>(
          builder: (context, state, child){
            return Text('로그인 완료: ${state.email}');
          },
        ),
      ),
    );
  }
}