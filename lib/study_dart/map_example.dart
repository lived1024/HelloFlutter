void main(){
  // 1. 맵 선언 : {}
  Map<int, String> intMap = {
    0 : 'AAA',
    50 : 'BBB',
    100 : 'CCC',
  };

  // 2. 맵 기본 사용
  print('intMap is $intMap');           // 아주 간단하게 출력할 수 있다!!!!
  print('intMap[50] : ${intMap[50]}');
  intMap.update(50, (val) => 'DDD');    // 50의 키값을 찾아서 'DDD'라는 값으로 수정

  // 3. 사용자 정의 클래스 활용
  Map<String, Student> students = {
    'jake' : Student('Jake', 'Warton', 'jake@gmail.com'),
    'tony' : Student('Tony', 'Stark', 'tony@gmail.com'),
    'kent' : Student('Kent', 'Beck', 'kent@gmail.com'),
  };

  //String fullName = students['jake'].firstName + ' ' + students['jake'].lastName;
  String fullName = students['jake']!.firstName + ' ' + students['jake']!.lastName;
  print('jake\'s full name is $fullName');

  //String email = students['kent'].email;
  String email = students['kent']!.email;
  print('Kent\'s email is $email');
}

class Student{
  String firstName;
  String lastName;
  String email;

  Student(this.firstName, this.lastName, this.email);
}