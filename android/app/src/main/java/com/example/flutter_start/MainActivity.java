package com.example.flutter_start;

import static android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY;

import android.os.BatteryManager;

import androidx.annotation.NonNull;

// 교재는 아래 라이브러리를 사용하도록 되어있다.
//import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {

    private static final String METHOD_BATTERY = "getBatteryLevel";
    private static final String CHANNEL_BATTERY = "android/battery";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        // 교재는 아래 한 줄이 자동생성 된다고 한다. 버전 차이가 있는 것으로 추정.
        //GeneratedPluginRegistrant.registerWith(flutterEngine);

        // 최신 버전은 오버라이드 시 아래의 한줄이 세팅되어있다.
        super.configureFlutterEngine(flutterEngine);
        
        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY).setMethodCallHandler(
                (call, result) -> {
                    if(METHOD_BATTERY.equals(call.method)){
                        BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);

                        // 교재는 주석처럼 기술되어있다. 플러터 버전에 따라 약간의 차이가 있는 것으로 추정
                        // 롤리팝 이상의 SDK를 써야 사용가능한 것으로 추정.
                        // int battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
                        int battery = 0;
                        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
                            battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
                        }
                        result.success(battery);
                    }
                    result.notImplemented();
                }
        );


    }
}
