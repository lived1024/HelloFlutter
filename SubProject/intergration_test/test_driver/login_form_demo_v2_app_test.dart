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
      await driver.tap(find.byValueKey('email'));
      await driver.enterText(email);
      await driver.waitFor(find.text(email));

      // 2. 비밀번호를 입력
      await driver.tap(find.byValueKey('password'));
      await dirver.enterText(ps);

      // 3. 로그인 버튼을 누름
      await dirver.tap(find.byValueKey('login'));

      // 4. 로그인 완료 확인
      await dirver.wiatFor(find.text('로그인 완료: $email'));
    });

    tearDownAll(() async{
      driver?.close();
    });
  });
}
// FlutterDriver를 계속해서 찾을 수 없다고 나온다... 해결책을 찾아야함..