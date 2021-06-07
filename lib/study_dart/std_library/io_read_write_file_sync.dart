import 'dart:io';

void main(){
  // 1. 새로운 파일 생성하기
  File newFile = File('temp_file.txt');   // 파일 객체 생성
  newFile.createSync();   // 프로젝트 루트에 새 파일 생성

  // 2. 파일 읽기(동기 방식)
  File poem = File('poem.txt');   // 파일 객체 생성
  List<String> lines = poem.readAsLinesSync();  // 한 줄씩 읽어 List에 저장
  for(String line in lines){
    print(line);
  }

  // 3. 파일 쓰기(동기 방식)
  File memoFile = File('diary.txt');    // 파일 객체 생성
  String contents = """
  2019.06.16 : 다트 파일 읽기 쓰기 공부

  IO패키지에 대해 공부를 진행했다.
  """;
  memoFile.writeAsStringSync(contents);
}