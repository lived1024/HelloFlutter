import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async{
  String url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);

  // jsonDecode는 dart:convert패키지를 임포트 해야한다.
  Map<String, dynamic> data = jsonDecode(response.body);
  print('userId : ${data['userId']}');
  print('id : ${data['id']}');
  print('title : ${data['title']}');
  print('complete : ${data['completed']}');
}
/// 이후 작업은 서울 지하철 정보와 연동하여 진행예정
/// 현 레파지토리에 작성하다 다른 레파지토리로 새로 만들어 이용하기로 결정
/// 곧 새 레파지토리를 생성할 예정이다.
/// 그 전에 서울열린데이터광장  http://data.seoul.go.kr 에 회원가입이 필요
/// 가입 후 Open API 이용을 위한 인증키를 신청해야한다