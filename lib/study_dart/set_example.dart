void main(){
  // Set은 동일한 값을 허용하지 않는 리스트로 생각하면 된다.
  // 단, 사용법이 리스트와 같은 것은 아니다.
  
  // 1. 집합 선언 : List는 []  , Set은 {}
  Set<int> naturalNumbers = {1, 2, 3, 4, 1};    // 실제로는 {1, 2, 3, 4}
  Set<String> ids = {"X-3", "X-2", "X-1"};

  // 2. 집합 사용 : 전체 출력방법은 리스트와 동일하다.
  print('numbers are $naturalNumbers');
  print('ids are $ids');
  //print('first number is ${naturalNumbers[0]}');    // 리스트처럼 특정 위치의 값을 출력할 수 없다. 
  for(int each in naturalNumbers){
    print('each number is $each');
  }
  // Set<int> integers = {0} + naturalNumbers;    // 리스트와는 다르게 +를 지원하지 않음

  // 3. 수학적 집합의 활용
  Set<int> a = {100, 200, 300};
  Set<int> b = {100, 200, 500, 1000};

  print('a union b = ${a.union(b)}');                 // 합집합
  print('a intersection b = ${a.intersection(b)}');   // 교집합
  print('a difference b  ${a.difference(b)}');        // 차집합
}