import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget{

  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage>{
  String _text = '배터리 잔량 : 모름';

  static const String CHANNEL_BATTERY = 'android/battery';
  static const String METHOD_BATTERY = 'getBatteryLevel';
  static const MethodChannel batteryChannel = MethodChannel(CHANNEL_BATTERY);

  // _refresh() async {
  //   print('refresh battery level');
  //
  //   String _newText;
  //   try {
  //     final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);
  //     _newText = '배터리 잔량 : $result %';
  //   } on PlatformException catch (e) {
  //       batteryLevel = "배터리 잔량 확인 실패 : '${e.message}'.";
  //   }
  //
  //   setState(() {
  //     _text = _newText;
  //   });
  //
  //   print(_text);
  // }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);
      batteryLevel = '배터리 잔량 : $result %';
    } on PlatformException catch (e) {
      batteryLevel = "배터리 잔량 확인 실패 : '${e.message}'.";
    }

    setState(() {
      _text = batteryLevel;
      print("setState :$_text");
    });

    print(_text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배터리 채널 데모 V1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('배터리 채널 데모 V1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('배터리 잔량 : 모름'),
              ElevatedButton(
              //RaisedButton(
                child: Text('가져오기'),
                onPressed: _getBatteryLevel,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           ElevatedButton(
  //             child: Text('Get Battery Level'),
  //             onPressed: _getBatteryLevel,
  //           ),
  //           Text(_text),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// 에러는 해결 완료,,
// MainActivity에서 경로문제가 있었던 것으로 추정..
// 다만 setState()를 이용해 화면에 출력되는 값을 수정했지만 반영이 안되고 있다...
// 폰에 연결하여 테스트를 진행했지만 같은 현상이 발생...