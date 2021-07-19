import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// 아래 문자열을 이용하여 정보를 받아오는 url을 구성한다.
/// userKey에는 인증키가 들어가야한다.
/// 테스트를 위해 역 이름을 광화문으로 고정해놓은 상태이다.
const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey   = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String _defaultStation = '광화문';

const int STATUS_OK = 200;

class MainPage extends StatefulWidget{

  @override
  State createState() => MainPageState();
}

class SubwayArrival{
  int _rowNum;
  String _subwayId;
  String _trainLineNm;
  String _subwayHeading;
  String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm, this._subwayHeading, this._arvlMsg2);

  int get rowNum => _rowNum;
  String get subwayId => _subwayId;
  String get trainLineNm => _trainLineNm;
  String get subwayHeading => _subwayHeading;
  String get arvlMsg2 => _arvlMsg2;
}

class MainPageState extends State<MainPage>{
  late int _rowNum;
  late String _subwayId;
  late String _trainLineNm;
  late String _subwayHeading;
  late String _arvlMsg2;

  String _buildUrl(String station){   // 지하철역을 입력받으면 정보를 조회할 수 있는 url 반환
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);
    return sb.toString();
  }

  _httpGet(String url) async{
    var response = await http.get(_buildUrl(_defaultStation));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    /// var     : 문자열을 할당한 뒤에 숫자를 할당할 수 없다. X (반대도 불가)
    /// dynamic : 문자열을 할당한 뒤에 숫자를 할당할 수 있다. O (반대도 가능)
    /// 즉, dynamic 타입은 동적으로 타입을 변경할 수 있다.
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if(errorMessage['status'] != STATUS_OK){
      setState((){
        final String errMessage = errorMessage['message'];
        _rowNum = -1;
        _subwayId = '';
        _trainLineNm = '';
        _subwayHeading = '';
        _arvlMsg2 = errMessage;
      });
      return;
    }

    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;

    // List.generate에 대해 알아볼 필요가 있을 것으로 보임.
    List<SubwayArrival> list = List.generate(cnt, (int i){
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(item['rowNum'],
                           item['subwayId'],
                           item['trainLineNm'],
                           item['subwayHeading'],
                           item['arvlMsg2'],);
    });

    SubwayArrival first = list[0];

    setState((){
      _rowNum = first.rowNum;
      _subwayId = first.subwayId;
      _trainLineNm = first.trainLineNm;
      _subwayHeading = first.subwayHeading;
      _arvlMsg2 = first._arvlMsg2;
    });
  }

  @override
  void initState() {
    super.initState();
    /// 해당 함수에서 변수를 초기화하지 않으면 LateInitializationError 에러가 발생한다.
    /// 참고서적은 이전 버전의 플러터 기반이며, 해당 부분이 없다면 에러가 발생하니 유의하자!!!!
    _rowNum = 0;
    _subwayId = "";
    _trainLineNm = "";
    _subwayHeading = "";
    _arvlMsg2 = "";
    _httpGet(_buildUrl(_defaultStation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지하철 실시간 정보'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('rowNum : $_rowNum'),
            Text('subwayId : $_subwayId'),
            Text('trainLineNm : $_trainLineNm'),
            Text('subwayHeading : $_subwayHeading'),
            Text('arvlMsg2 : $_arvlMsg2'),
          ],
        ),
      ),
    );
  }
}