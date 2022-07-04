package com.app_life_example;


import android.os.Bundle;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.lifecycle.LifecycleOwner;

import com.app_life.AppLifeManage;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    private  static String TAG=MainActivity.class.getName();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AppLifeManage.registerLife(AppLifeManage.LifeEnum.ON_CREATE);
        Log.e(TAG, "onCreate: " );
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Log.e(TAG, "onRestart: ");
        AppLifeManage.registerLife(AppLifeManage.LifeEnum.ON_RESTART);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.e(TAG, "onResume: ");
        AppLifeManage.registerLife(AppLifeManage.LifeEnum.ON_RESUME);
    }
}
