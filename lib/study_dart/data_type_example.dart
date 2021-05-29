void main(){
  // 1. 문자열
  String str1 = 'flutter';
  String str2 = 'google';
  String plus = str1 + ' ' + str2;
  int len = plus.length;
  print(plus + ' => length : $len');

  // 2. 부울형
  bool a = true;
  bool b = false;
  bool chk = a && b;
  print('chk is $chk');

  // 3. 동적 타입(var)
  var strLen = len;     // 숫자형
  var text = str1;      // 문자열
  var check = chk;      // 부울형
  var variable = text;  // var형
  print('$strLen, $text, $check, $variable');

  // 컴파일 오류 : 이전에 String형으로 인식되었기에 부울형으로 변환이 되지 않는다.
  // variable = chk;
  // print('$variable');
}