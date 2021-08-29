import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(LocationPage());

class LocationPage extends StatefulWidget{

  @override
  State createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage>{
  String _text = '현재 위치 : 모름';

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
      /// LocationAccuracy 위치 정확도   Android     iOS
      /// lowest                       500m 이내    3000m 이내
      /// low                          상동         1000m 이내
      /// medium                       상동         100m  이내
      /// high                         0~100m 사이  10m   이내
      /// best                         0~100m 사이  0m    이내
      /// bestForNavigation            best와 동일  네비게이션을 위한 최적화
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      String result = "(${position.latitude}, ${position.longitude})";
      _newText = '현재 위치는 $result';
    } on PlatformException{
      _newText = '현재 위치를 사용할 수 없습니다.';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 위치 채널 데모 V1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('현재 위치 채널 데모 V2')),
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