# flutter_start

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# flutter 설치 중 에러 처리
## flutter doctor 실행 시 에러사항
### 안드로이드 스튜디오가 설치된 상황에서 [!] Android Studio (not installed) 발생
* 안드로이드 설치 경로를 찾지 못하여 해당 현상 발생  
  아래 스크립트를 실행하여 강제로 경로 설정
```
// 플러터가 설치된 경로에서 콘솔로 다음 줄의 명령어 실행
$ flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
```
  이후 flutter doctor 실행 시 정상적인 결과를 확인할 수 있음