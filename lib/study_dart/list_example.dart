void main(){
  // 1. 다양한 리스트 : 타 언어의 배열처럼 선언.
  // 배열처럼 생성 크기가 제한적이지 않고 자동으로 늘어남.
  List<int> numbers = [100, 200, 300];
  List<int> evens = [2, 4, 6, 8, 10];

  List<String> planets = ['Earth', 'Jupiter', 'Mars', 'Saturn'];
  List<String> otherPlanets = ['Venus', 'Mercury', 'Neptune'];

  // 2. 리스트 기본 : 반복문으로 강제출력 하지 않아도 됨.
  print('numbers are $numbers');
  print('first number is ${numbers[0]}');
  print('last number is ${numbers[numbers.length-1]}');

  for(int each in evens){
    // 물론 반복문을 이용한 출력도 가능
    print('each even number is $each');
  }

  // 3. 리스트 활용 : 리스트 합치는 기능
  List<int> evenFromZero = [0, ...evens];
  // [0] 이라는 값을 가진 배열에 evens라는 배열의 값을 합쳐준다.
  print('evenFromZero is $evenFromZero');

  List<String> allPlanets = planets + otherPlanets;
  // plants 배열과 otherPlanets 배열을 하나로 합친다.
  print('All planets are $allPlanets');
}