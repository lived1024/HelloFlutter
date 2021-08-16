import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {
  String _text = '배터리 잔량: 모름';

  static const String CHANNEL_BATTERY = 'android/battery';    // 안드로이드 폴더에서 정의한 채널고 메서드 상수 지정
  static const String METHOD_BATTERY = 'getBatteryLevel';
  static const MethodChannel batteryChannel = MethodChannel(CHANNEL_BATTERY); // MethodChannel 채널 생성

  _refresh() async {
    print('refresh battery level');

    String _newText;
    try {
      final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);   // 채널에 정의된 메서드 호출(invokeMethod)
      _newText = '배터리 잔량: $result %';
    } on PlatformException {
      _newText = '베터리 잔량을 알 수 없습니다.';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배터리 채널 데모 V2',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('배터리 채널 데모 V2')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              ElevatedButton(
                child: Text('가져오기'),
                onPressed: _refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 오늘은 패스..