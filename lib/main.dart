import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// StatelessWidget : 상태가 없는 위젯
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '플러터 실행 테스트'),
    );
  }
}

// StatefulWidget : 상태가 있는 위젯
// Stateless 위젯과 다른 점은 createState() 메서드를 통해 상태를 담당하는 클래스를 지정할 수 있음.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 클래스 앞의 _(언더바)는 private class를 의미한다.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState() 함수를 실행하면 MyHomePage 위젯 상태가 변했으니 위젯을 갱신한다.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 해당 메소드는 setState() 실행시 재실행된다.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // 우측 하단에 표시되는 + 버튼 설정
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,   // 이벤트 발생 시 _incrementCounter() 함수 실행
        tooltip: 'Increment',           // 툴팁 내용 설정
        child: Icon(Icons.add),         // 아이콘 설정
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
