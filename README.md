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

# 플러터 공부용 레파지토리
**"처음 배우는 플러터" - 저자 : 유동환**    
예제소스 : [요기](https://github.com/yudong80/flutter_programming) 참조 

# flutter 개발 환경 설정

## 절차
### 준비중

## 환경 설정 시 발생 Error
* 안드로이드 스튜디오가 설치됐지만 flutter doctor 실행 시 [!] Android Studio (not installed) 발생
    안드로이드 설치 경로를 찾지 못하여 해당 현상 발생  
    flutter 설치 폴더 내에서 콘솔로 경로 강제 설정
    ```
    $ flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
    ```
    이후 flutter doctor 실행 시 정상적인 결과를 확인할 수 있음