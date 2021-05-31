import 'atm_v1.dart';

void main(){
  // 1. 타입 테스트 연산자
  var account = Account('111-222-33-01', 50000);
  if(account is Account){   // is는 타입 검사, as는 형 변환
    String? name = account.accountNumber;       //책에는 String형이지만 널 허용을 위해 ?를 붙여준다
    int amount = (account as Account).balance;  //불필요한 캐스팅 - is는 타입 검사, as는 형 변환
    print('account name is $name, amount is $amount');
  }

  // 2. if null 연산자
  String? loginAccount = null;                  //책에는 String형이지만 널 허용을 위해 ?를 붙여준다
  String playerName = loginAccount ?? 'Guest';  // ?? : if null 역할
  print('Login Player is $playerName');

  // 3. 캐스케이드 연산자
  //  ..을 이용해 해당 객체의 메서드 연속 호출 가능
  Account account2 = Account('222-333-33-01', 60000)
    ..deposit(5000)
    ..transfer(account, 10000)
    ..withdraw(5000);
  print('account 2 balance is ${account2.balance}');

  // 4. 조건적 멤버 접근 연산자
  Account account3 = Account(null, 6000);
  print('account 3 is ${account3?.accountNumber}');
  // 널 허용을 해서, NullPointerException 발생시에도 강제종료 방지
}