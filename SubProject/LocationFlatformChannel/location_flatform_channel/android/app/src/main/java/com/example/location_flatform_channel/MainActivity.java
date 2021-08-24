package com.example.location_flatform_channel;

import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String TAG = "PlatformChannels";

    private static final String METHOD_CURRENT_LOCATION = "getCurrentLocation";
    private static final String CHANNEL_LOCATION = "android/location";

    private FusedLocationProviderClient fusedLocationClient;


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        Log.d(TAG, "configureFFlutterEngine()");
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_LOCATION).setMethodCallHandler(
                (call, result) -> {
                    Log.d(TAG, "location_channel :: method " + call.method);
                    if(METHOD_CURRENT_LOCATION.equals(call.method)){
                        getCurrentLocation(result);
                    }
                }
        );
    }

    // 아래는 권한문제로 에러가 발생중.... 교재와는 달라서 확인이 필요할듯.
    private void getCurrentLocation(MethodChannel.Result result){
        fusedLocationClient.getLastLocation().addOnSuccessListener(this, location -> {
            if(location != null){
                String res = "(" + location.getLatitude() + ", " + location.getLongitude() + ")";
                Log.d(TAG, "location? " + res);
                result.success(res);
            }
        })
    }
}
