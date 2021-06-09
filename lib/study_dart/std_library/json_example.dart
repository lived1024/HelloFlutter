import 'dart:convert';

import 'dart:io';

void main(){
  /// jsonDecode : JSON형식의 문자열을 Map형태로 반환
  /// jsonEncode : Map 데이터를 JSON 형식으로 변환
  
  // 1. JSON 문자열 파싱하기
  String jsonStr = """
  { "basket" : {
      "apple" : 50,
      "banana" : 10,
      "grape" : 5
    }
  }
  """;
  Map json = jsonDecode(jsonStr);     // JSON형식을 MAP형태로 변환
  Map basket = json["basket"];        // 윗 줄의 basket의 값을 가져와 다시 Map형태로 변수 설정
  int apples = basket["apple"];       // apple의 value값
  int bananas = basket["banana"];     // banana의 value값
  int grapes = basket["grape"];       // grape의 value값
  print("apples are $apples");
  print("bananas are $bananas");
  print("grape are $grapes");

  // 2. JSON 파일 읽기
  Map basketMap = _readBasketJson('basket.json');
  print('grapes was ${basketMap["grape"]}');

  // 3. JSON 파일 쓰기
  basketMap.update('grape', (v) => 99);
  File('basket.json').writeAsStringSync(jsonEncode(basketMap));

  Map updated = _readBasketJson('basket.json');
  int grapesNow = updated["grape"];
  print('now grapes are $grapesNow');
}

Map _readBasketJson(String fileName){
  String contents = File(fileName).readAsStringSync();    // 문자열로 파일 읽어오기
  print('contents : $contents');
  return jsonDecode(contents);    // 읽어온 내용 Map형태로 반환
}