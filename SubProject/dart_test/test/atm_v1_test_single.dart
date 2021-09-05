import 'package:test/test.dart';          // test 패키지 import
import 'package:dart_test/atm_v1.dart';   // test 대상

void main() {
  // 테스트 케이스 정의할 때 test() 함수를 호출,,
  // setState() 처럼 인자가 없는 함수를 넣어주면 된다.
  test('계좌 생성 테스트', () {
    String accountName = '117-123-1';
    int amount = 20000;

    Account account = Account(accountName, amount);
    
    // expect를 이용하여 생성된 값과 입력한 값이 동일한지 체크
    expect(account.accountNumber, equals(accountName));
    expect(account.balance, equals(amount));
  });
}