import 'package:flutter/material.dart';
import 'package:flutter_start/state_simple.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SimpleState>(
          builder: (context, state, child){
            return Text('로그인 완료: ${state.email}');
          },
        ),
      ),
    );
  }
}