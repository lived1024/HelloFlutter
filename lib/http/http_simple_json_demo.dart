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
/// 