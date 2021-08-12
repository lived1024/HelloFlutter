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
  //   } on PlatformException{
  //     _newText = '배터리 잔량을 알 수 없습니다.';
  //   }
  //
  //   setState(() {
  //     _text = _newText;
  //   });
  //
  //   print(_text);
  // }

  static const platform = MethodChannel(CHANNEL_BATTERY);

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
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: '배터리 채널 데모 V1',
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       appBar: AppBar(title: Text('배터리 채널 데모 V1')),
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Text('배터리 잔량 : 모름'),
  //             ElevatedButton(
  //             //RaisedButton(
  //               child: Text('가져오기'),
  //               onPressed: _refresh,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_text),
          ],
        ),
      ),
    );
  }
}

// 버튼 클릭 시 잔량은 가져오지만 표기하면서 에러가 발생하고 있다.
// onPressed 이벤트에서 에러가 나는 것으로 추정....

// 4일 연속 퇴근 후 집에 들어오니 12시....
// 개피곤.... ㅠ