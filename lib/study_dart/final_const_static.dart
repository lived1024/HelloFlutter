void main(){
  // 1. final : 한번 설정 후 다른 값으로 변경 불가
  final String name = 'Tony';
  //name = 'Steve';       // 컴파일 에러

  // 2. const : 주로 상수에 사용 (자바의 public static final의 단순화)
  const int STUDENTS_MAX = 100;
  const double PIE = 3.14159326;

  // 3. static : Queue 클래스의 initialCapacity를 바로 참조.
  print('Queue initial capacity is ${Queue.initialCapacity}');
}

class Queue{
  static const initialCapacity = 12;
}