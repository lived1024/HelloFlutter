import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(LocationPage());

class LocationPage extends StatefulWidget{

  @override
  State createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage>{
  String _text = '현재 위치 : 모름';

  static const String CHANNEL_LOCATION = "android/location";
  static const String METHOD_CURRENT_LOCATION = "getCurrentLocation";
  static const MethodChannel locationChannel = MethodChannel(CHANNEL_LOCATION);

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async{
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
  }

  _refresh() async{
    print('refresh current location');

    String _newText;
    try{
      // 현재 위치데이터를 제대로 가져오지 못하고 있는 것을 확인했다.
      // 정상적으로 값을 가져오지 못하는 것은 가상기기에서 위치 설정을 안해서였던 것으로 확인됨...
      // 공기계에 연결하여 테스트한 결과는 정상적이었다...
      // 결국 며칠동안 새 프로젝트 생성해서 했던 일이 바보짓.... ㅠ
      // 또한 배터리 잔량 확인 파일 실행 시 정상작동하지만 에러가 발생중... 확인 필요
      final String result = await locationChannel.invokeMethod(METHOD_CURRENT_LOCATION);
      _newText = '현재 위치는 $result ';
    } on PlatformException{
      _newText = '현재 위치는 사용 불가합니다.';
    }

    print("_newText : " + _newText);

    setState(() {
      _text= _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 위치 채널 데모 V1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('현재 위치 채널 데모 V1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              RaisedButton(
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