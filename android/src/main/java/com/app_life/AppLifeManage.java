package com.app_life;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * AppLifePlugin
 */
public class AppLifeManage implements FlutterPlugin, MethodCallHandler {
    private static MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "app_life");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
    public static void registerLife(LifeEnum lifeEnum) {
        if(channel!=null)
        channel.invokeMethod(lifeEnum.name(),null);
    }

   public enum  LifeEnum{
        ON_CREATE,
        ON_START,
        ON_RESTART,
        ON_RESUME,
        ON_STOP,
        ON_PAUSE,
        ON_DESTROY
    }
}
