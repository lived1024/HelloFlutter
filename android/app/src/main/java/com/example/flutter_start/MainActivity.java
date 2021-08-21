package com.example.flutter_start;

//import static android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY;
//
//import android.content.ContextWrapper;
//import android.content.Intent;
//import android.content.IntentFilter;
//import android.os.BatteryManager;
//import android.os.Build;
//
//import androidx.annotation.NonNull;
//
//// 교재는 아래 라이브러리를 사용하도록 되어있다.
////import io.flutter.plugins.GeneratedPluginRegistrant;
//
//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugin.common.MethodChannel;
//import io.flutter.plugins.GeneratedPluginRegistrant;
//
// 아래는 현재 배터리 잔량 확인용 클래스
//public class MainActivity extends FlutterActivity {
//
//    private static final String METHOD_BATTERY = "getBatteryLevel";         // 플러터 앱에서 호출할 채널명을 상수로 지정
//    private static final String CHANNEL_BATTERY = "android/battery";
//
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        // 교재는 아래 한 줄이 자동생성 된다고 한다. 버전 차이가 있는 것으로 추정.
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//
//        // 최신 버전은 오버라이드 시 아래의 한줄이 세팅되어있다.
//        //super.configureFlutterEngine(flutterEngine);
//
//        // MethodChannel 객체를 통해 CHANNEL_BATTERY 생성
//        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY).setMethodCallHandler(   // MethodChannel객체를 통해 CHANNEL_BATTERY 생성
//                (call, result) -> {
//                    if(METHOD_BATTERY.equals(call.method)){
//                        // CHANNEL_BATTERY 안에 BATTERY_SERVICE를 정의
//                        BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);    // METHOD_BATTERY 정의
//
//                        // 교재는 안드로이드 버전에 따른 처리가 누락된 것으로 보인다.
//                        int battery = -1;
//                        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
//                            // BATTERY_PROPERTY_CAPACITY : 현재 배터리 수준을 가져옴
//                            battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
//                        } else {
//                            Intent intent = new ContextWrapper(getApplicationContext()).
//                                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
//                            battery = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
//                                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
//                        }
//
//                        if (battery != -1) {
//                            result.success(battery);    // 정상적으로 가져올 때 플러터 앱으로 반환
//                        } else {
//                            result.error("UNAVAILABLE", "Battery level not available.", null);
//                        }
//
//                    } else {
//                        result.notImplemented();        // METHOD_BATTERY 외에 정의하지 않은 메서드가 호출되면 플러터로 오류 반환
//                    }
//                }
//        );
//    }
//}

// 아래는 위치 확인용 클래스
public class MainActivity extends FlutterActivity {
    private static final String TAG = "PlatformChannels";

    // 채널 이름과 메서드 이름을 상수로 선언
    private static final String METHOD_CURRENT_LOCATION = "getCurrentLocation";
    private static final String CHANNEL_LOCATION = "android/location";

    private FusedLocationProviderClient fusedLocationClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        Log.d(TAG, "configureFlutterEngine()");
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        // fusedLocationClient 변수 초기화
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY).setMethodCallHandler(
                (call, result) -> {
                    if (METHOD_BATTERY.equals(call.method)) {
                        BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
                        int battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
                        result.success(battery);
                    }
                    result.notImplemented();
                }
        );

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_LOCATION).setMethodCallHandler(
                (call, result) -> {
                    Log.d(TAG, "location_channel :: method " + call.method);
                    if (METHOD_CURRENT_LOCATION.equals(call.method)) {
                        // 로케이션 채널 생성 후 getCurrentLocation 메서드 호출 시 실제 자바 메서드인 getCurrentLocation() 호출
                        getCurrentLocation(result);
                    }
                }
        );
    }

    // fusedLocationClient.getLastLocation() 메서드 호출하여 실제 현재 위치(위도,경도) 정보를 가져온다.
    private void getCurrentLocation(MethodChannel.Result result) {
        fusedLocationClient.getLastLocation()
                // 현재 위치를 가져온 이후 addOnSuccessListener 콜백이 호출되어 location 변수로 넘어간다.
                .addOnSuccessListener(this, location -> {
                    if (location != null) {
                        String res = "(" + location.getLatitude() + ", " + location.getLongitude() + ")";
                        Log.d(TAG, "location? " + res);
                        // result 변수에 success 메서드를 호출하면 결과가 반환된다.
                        result.success(res);
                    }
                });
    }
}