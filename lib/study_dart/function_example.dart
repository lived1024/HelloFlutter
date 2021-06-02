void main(){
  // 1. 함수 호출
  int a = 100;
  int b = 200;
  int c = _getBigger(a, b);
  print('_getBigger(a, b) = $c');

  // 2. 중복 호출 : 함수를 인자로 보낼 수 있음
  String str = "apple";
  String addBrace = addSuffix(addPrefix(str, '('), ')');
  print(addBrace);

  // 3. 선택인자(positional optional parameter)
  int num1 = 100;
  int num2 = addNumber(100);      // inc = 1 대입   : 미사용
  int num3 = addNumber(100, 20);  // inc = 20 대입  : 사용
  print('num1 : $num1');
  print('num2 : $num2');
  print('num3 : $num3');

  // 4. 이름 있는 인자(named optional parameter)
  String http1 = getHttp('http://naver.com', port: 80); // 사용 시 인자 이름 입력 필수
  String http2 = getHttp('http://localhost');
  print('http1 : $http1');
  print('http2 : $http2');
}

int _getBigger(int a, int b){
  if(a >= b) return a;
  return b;
}

String addPrefix(String str, String prefix) => '$prefix $str';

String addSuffix(String str, String suffix) => '$str $suffix';

// num : 필수인자(필수 입력 파라미터)
// inc : 선택인자(선택 입력 파라미터) - 미입력 시 default : 1 // 입력 시 : 입력값
int addNumber(int num, [int inc = 1]) => num + inc;

// 이름 있는 인자 : 선택인자에만 사용 가능
// 함수를 호출할 때도 포트 인자는 port=9999 처럼 입력해야한다.
String getHttp(String url, {int port = 8080}){
  return 'get http from $url, port = $port';
}