import 'package:flutter/material.dart';
import 'model/subway_arrival.dart';
import 'api/subway_api.dart' as api;


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
                'assets/icon/subway.png',
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
}