package com.example.flutter_start;

import static android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;

import androidx.annotation.NonNull;

// 교재는 아래 라이브러리를 사용하도록 되어있다.
//import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {

    private static final String METHOD_BATTERY = "getBatteryLevel";
    private static final String CHANNEL_BATTERY = "android/battery";

    private static final String CHANNEL = "samples.flutter.dev/battery";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        // 교재는 아래 한 줄이 자동생성 된다고 한다. 버전 차이가 있는 것으로 추정.
        //GeneratedPluginRegistrant.registerWith(flutterEngine);

        // 최신 버전은 오버라이드 시 아래의 한줄이 세팅되어있다.
        super.configureFlutterEngine(flutterEngine);
        
        // MethodChannel 객체를 통해 CHANNEL_BATTERY 생성
        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
//                    if(METHOD_BATTERY.equals(call.method)){
//                        // CHANNEL_BATTERY 안에 BATTERY_SERVICE를 정의
//                        BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
//
//                        // 교재는 주석처럼 기술되어있다. 플러터 버전에 따라 약간의 차이가 있는 것으로 추정
//                        // 롤리팝 이상의 SDK를 써야 사용가능한 것으로 추정.
//                        // int battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
//                        int battery = 0;
//                        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
//                            // BATTERY_PROPERTY_CAPACITY : 현재 배터리 수준을 가져옴
//                            battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
//                        }
//                        result.success(battery);    // 정상적으로 가져올 때 플러터 앱으로 반환
//                    }
//                    result.notImplemented();        // METHOD_BATTERY 외에 정의하지 않은 메서드가 호출되면 플러터로 오류 반환

                    if (call.method.equals("getBatteryLevel")) {
                        int batteryLevel = getBatteryLevel();

                        if (batteryLevel != -1) {
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null);
                        }
                    } else {
                        result.notImplemented();
                    }


                }
        );        
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }
}
