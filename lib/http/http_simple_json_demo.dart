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
/// 그 전에 서울열린데이터광장  http://data.seoul.go.kr 에 회원가입이 필요
/// 가입 후 Open API 이용을 위한 인증키를 신청해야한다
/// 서울시 지하철 실시간 도착정보 : http://data.seoul.go.kr/dataList/OA-12764/A/1/datasetView.do
/// 오픈 API 인증키는 .gitignore 목록에 추가하여 비공개로 진행
/// 테스트용 인증키로 sample을 이용할 수 있다.