import 'package:flutter/material.dart';

/// 상태 관리의 대상 모델
/// ChangeNotifier 상속 이외에 특이한 내용은 없다.
/// 타 클래스에서 접근 시에는 Provider.of()메서드를 호출해야한다.
class SimpleState extends ChangeNotifier{
  late String _email;

  void setEmail(String email){
    _email = email;
  }

  String get email => _email;
}