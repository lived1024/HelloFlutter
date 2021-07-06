// pubspec.yaml의 dependencies에 http를 추가해야된다.
// as 를 이용한 alias 사용
import 'package:http/http.dart' as http;

void main() async{      // 함수에 async : 비동기 함수  => 함수 내에 await가 있다
  // 아래 url로 접속 시 response되는 json을 확인할 수 있다.
  String url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);   // await 사용 시 해당 함수에 async 필요
  print('status = ${response.statusCode}');
  print('response = ${response.body}');
}