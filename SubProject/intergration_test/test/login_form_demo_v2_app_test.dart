import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('통합 테스트 > ', (){
    FlutterDriver driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    
    test('로그인 테스트', () async{
      const email = 'flutter@gmail.com';
      const ps = '1234';
      
      // 1. 이메일을 입력
    });
  });
}