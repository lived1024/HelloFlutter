void main(){
  // 1. 주석 <= 한줄
  /* 범위 주석 */

  /** 여러줄 주석 - 엔터 입력 시 다음 줄도 주석입력 모양 생성
   *
  **/

  /// 문서 주석(여러줄) - 엔터 입력 시 다음 줄도 주석입력 모양 생성
  ///

  // 2. 변수
  int num1 = 100;
  double num2 = 3.14;
  // num 타입은 정수, 실수 둘다 사용 가능하다
  num num3 = 100;
  num num4 = 3.14;

  double sum1 = num1 + num2;
  //int sum2 = num1 + num2;   // 정수 + 실수로 에러 발생

  print("sum1 : " + sum1.toString());

  num sum3 = num3 * num4;
  print("sum3 : " + sum3.toString());

  // 3. 문자열 : 문자열 사용 시 다트 권장사항은 홑따옴표 이용
  String text = 'Carpe diem, quam minimum credula postero';
  String myName = 'youngrae';
  String hello = 'Hello, ${myName}';  // 문자열 내부에 ${}를 이용하여 변수를 넣을 수 있다.

  print(text.substring(0, 10));
  print(hello);
}