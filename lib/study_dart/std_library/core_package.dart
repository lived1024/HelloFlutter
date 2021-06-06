void main(){
  // 1. print 함수 내부 살펴보기
  print('hello');   // Ctrl + B 입력 시 메서드 내부로 들어갈 수 있다.

  // 2. 숫자 -> 문자 변환
  int num1 = 5000;
  double num2 = 360.1234;

  String num1Str = num1.toString();
  String num2Str = num2.toStringAsFixed(2);   // 소수점 제한하면서 문자열로 변환
  print('num1 to str is $num1Str');
  print('num2 to str is $num2Str');

  // 3. 문자 -> 숫자 변환
  List<String> inputs = [
    '-1',
    '1234',
    '32.25'
  ];

  print(int.parse(inputs[0]));
  print(int.parse(inputs[1]));
  print(double.parse(inputs[2]));
  print(num.parse(inputs[2]));    // int, double 등 숫자 통합으로 사용해도 됨.
}