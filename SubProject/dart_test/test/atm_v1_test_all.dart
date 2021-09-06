import 'package:test/test.dart';        // 테스트코드 작성 시 반드시 import해야된다.
import 'package:dart_test/atm_v1.dart';

void main(){
  test('계좌 생성 테스트', (){
    String accountName = '117-123-1';
    int amount = 20000;

    Account account = Account(accountName, amount);

    expect(account.accountNumber, equals(accountName));
    expect(account.balance, equals(amount));
  });

  test('계좌 인출 테스트', (){             // 인출 시 잔고 -
    String accountName = '117-123-1';
    int amount = 20000;
    int withdraw = 7000;

    Account account = Account(accountName, amount);
    account.withdraw(withdraw);

    expect(account.balance, equals(amount - withdraw));
  });

  test('계좌 입금 테스트', (){             // 입금 시 잔고 +
    String accountName = '117-123-1';
    int amount = 20000;
    int deposit = 7000;

    Account account = Account(accountName, amount);
    account.deposit(deposit);

    expect(account.balance, equals(amount + deposit));
  });

  test('계좌 이체 테스트', (){             // 이체시 본 계좌 -, 받는 계좌 +
    String accountName1 = '117-123-1';
    String accountName2 = '117-123-2';
    int amount1 = 20000;
    int amount2 = 5000;
    int move = 5000;

    Account account1 = Account(accountName1, amount1);
    Account account2 = Account(accountName2, amount2);

    account1.transfer(account2, move);

    expect(account1.balance, equals(amount1 - move));
    expect(account2.balance, equals(amount2 + move));
  });
}



///                       테스트 코드                      일반코드
/// code location     /test                           /lib
/// package           test        (logic test)
///                   flutter_test(widget test)
/// pubspec.yaml      dev_dependencies                dependencies
/// filename          filename + _test