import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/subway_arrival.dart';
import 'api/subway_api.dart' as api;
import 'package:http/http.dart' as http;


class MainPage extends StatefulWidget{
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  TextEditingController _stationController = TextEditingController(text: api.defaultStation);
  List<SubwayArrival> _data = [];
  bool _isLoading = false;        // 공공 API조회 시 프로그레스 바를 띄우기 위해 사용

  List<Card> _buildCards(){
    print('>>> _data.length? ${_data.length}');

    if(_data.length == 0){
      return <Card>[];    // 데이터가 없는 경우 빈 리스트 반환
    }
    List<Card> res = [];
    // 데이터가 있는 경우, Card 위젯을 생성하고, 그 안에 Column위젯을 넣는다.
    // 카드 상단은 AspectRatio 위젯으로 18:11의 화면비를 유지하고 그 안에 이미지를 표시한다.
    // 이미지 크기를 맞추는 방법은 높이 우선(BoxFit.fitHeight)다.
    for(SubwayArrival info in _data){
      Card card = Card(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/11,
              child: Image.asset(
                'assets/subway.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.1, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      info.trainLineNm,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,  // 정보가 넘치는 경우 마지막을 점으로 처리
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      info.arvlMsg2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,  // 정보가 넘치는 경우 마지막을 점으로 처리
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
      res.add(card);
    }
    // 반복문 완료 후 리스트 반환
    return res;
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  _onClick(){
    _getInfo();
  }

  _getInfo() async{
    // 프로그레스 바가 표기 - build() 메서드에서 추가 설명
    setState(() => _isLoading = true);

    String station = _stationController.text;
    var response = await http.get(api.buildUrl(station));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    // 상태값을 확인하여 오류 판별
    if(errorMessage['status'] != api.STATUS_OK){
      setState(() {
        final String errMessage = errorMessage['message'];
        print('error >> $errMessage');
        _data = const [];
        _isLoading = false;
      });
      return;
    }

    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;

    List<SubwayArrival> list = List.generate(cnt, (int i){
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'],
        item['subwayId'],
        item['trainLineNm'],
        item['subwayHeading'],
        item['arvlMsg2'],
      );
    });

    setState(() {
      _data = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('지하철 실시간 정보'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())    // CircularProgressIndicator : 원형 프로그레스바
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,     // crossAxisAlignment 두 열 구성
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            child: Row(
              children: <Widget>[
                Text('역 이름'),
                SizedBox(width: 10),
                Container(
                  width: 150,
                  child: TextField(
                    controller: _stationController,
                  ),
                ),
                Expanded(
                  child: SizedBox.shrink(),
                ),
                ElevatedButton(
                //RaisedButton(         교재에는 RaisedButton으로 되어있다.
                  child: Text('조회'),
                  onPressed: _onClick,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text('도착 정보'),
          ),
          SizedBox(height: 10),
          Flexible(                   // Flexible을 이용하여 GridView의 크기를 늘려서 표현
            child: GridView.count(
              crossAxisCount: 2,
              children: _buildCards(),  // 내용은 _buildCards()의 반환값 이용
            ),
          ),
        ],
      ),
    );
  }
}

// 오늘은 첫출근인데 늦은 퇴근예정으로 혹시모를 커밋....