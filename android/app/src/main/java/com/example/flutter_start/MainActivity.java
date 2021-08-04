package com.example.flutter_start;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        // 최신 버전은 오버라이드 시 아래의 한줄이 세팅되어있다.
        //super.configureFlutterEngine(flutterEngine);
        // 교재는 아래 한 줄이 자동생성 된다고 한다. 버전 차이가 있는 것으로 추정.
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
