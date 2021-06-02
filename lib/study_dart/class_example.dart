void main(){
  // 1. Game 클래스 생성
  Game game1 = Game('Star Craft', 'Strategy');
  Game game2 = ArcadeGame('Strike 1945', 'Shooting', true);

  // 2. 속성
  print('game1 is ${game1.name}');
  print('game2 is ${game2.name}');

  game1.genre = 'Realtime Strategy';  // Game 클래스의 세터 사용

  // 3. 메서드 호출
  game1.play();
  game2.play();
}

// 부모 클래스 -------------------------------------
class Game{
  String _name;
  String _genre;

  // 생성자
  Game(this._name, this._genre);

  // getter, setter
  String get name => _name;           // name 속성을 이용해 _name의 값을 가져온다
  set genre(g) => this._genre = g;    // genre 속성을 이용해 _genre의 값을 설정한다

  void play(){
    print('play $_name game($_genre)!!');
  }
}

// 자식 클래스 -------------------------------------
class ArcadeGame extends Game{
  bool _joystickSupport = false;

  // 생성자 : 선언 시 부모 클래스의 인자까지 한번에 설정
  ArcadeGame(String name, String genre, this._joystickSupport) : super(name, genre);

  @override
  void play(){
    print('$name supports joystick? $_joystickSupport');
  }
}