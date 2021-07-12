// 20210712234731
// http://swopenapi.seoul.go.kr/api/subway/(인증키)/json/realtimeStationArrival/0/5/%EA%B4%91%ED%99%94%EB%AC%B8

import 'dart:convert';

const String header = '''
{
  "errorMessage": {
    "status": 200,
    "code": "INFO-000",
    "message": "정상 처리되었습니다.",
    "link": "",
    "developerMessage": "",
    "total": 4
  }
}
''';

void main(){
  var parsed = jsonDecode(header);
  Map<String, dynamic> errorMessage = parsed['errorMessage'];

  print('status  : ${errorMessage['status' ]}');
  print('code    : ${errorMessage['code'   ]}');
  print('message : ${errorMessage['message']}');
  print('total   : ${errorMessage['total'  ]}');
}