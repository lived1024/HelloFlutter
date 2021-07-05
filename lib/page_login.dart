import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_start/login_form_demo_v2.dart';
import 'package:provider/provider.dart';

import 'state_simple.dart';

class LoginPage extends StatefulWidget{

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final TextEditingController _emailController = TextEditingController(text: 'your_name@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: 'input password');

  void _onLogin(BuildContext context){
    final String email = _emailController.text;                   // _emailController에서 text값을 가져옴

    // 버전 상향 후 Provider.of 함수에 listen: false를 사용하지 않는다면 에러가 발생한다.
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);  // SimpleState 모델 객체 가져온다.
    state.setEmail(email);                                        // 해당 객체에 정의된 setEmail 메서드 호출

    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void _onCancel() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'heoro',
                child: CircleAvatar(
                  child: Image.asset('assets/logo.jpg'),
                  backgroundColor: Colors.transparent,
                  radius: 58.0, //unit : logical pixel?
                )
            ),
            SizedBox(height: 45.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _emailController,
            ),
            SizedBox(height: 15.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _passwordController,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Log In'),
                  onPressed: () => _onLogin(context),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: _onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}