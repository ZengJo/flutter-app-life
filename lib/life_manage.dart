import 'package:app_life/life_manage_call.dart';
import 'package:flutter/services.dart';

class LifeManage {
  static const String create = "ON_CREATE";
  static const String start = "ON_START";
  static const String restart = "ON_RESTART";
  static const String resume = "ON_RESUME";
  static const String stop = "ON_STOP";
  static const String pause = "ON_PAUSE";
  static const String destroy = "ON_DESTROY";
  static const didFinishLaunchingWithOptions =
      "DID_FINISH_LAUNCHING_WITH_OPTIONS";
  static const applicationWillResignActive = "APPLICATION_WILL_RESIGN_ACTIVE";
  static const applicationDidEnterBackground =
      "APPLICATION_DID_ENTER_BACKGROUND";
  static const applicationWillEnterForeground =
      "APPLICATION_WILL_ENTER_FOREGROUND";
  static const applicationDidBecomeActive = "APPLICATION_DID_BECOME_ACTIVE";
  static const applicationWillTerminate = "APPLICATION_WILL_TERMINATE";
  static const MethodChannel _channel = MethodChannel('app_life');

  static LifeManage? _instance;
  static LifeManage? get instance => getInstance();

  static LifeManage getInstance() {
    _instance ??= LifeManage();
    return _instance!;
  }

  void addObserver(LifeManageCall lifeCall) {
    _channel.setMethodCallHandler((resultCall) async {
      MethodCall call = resultCall;
      String method = call.method;
      switch (method) {
        case create:
          lifeCall.onCreate();
          break;
        case start:
          lifeCall.onStart();
          break;
        case restart:
          lifeCall.onRestart();
          break;
        case resume:
          lifeCall.onResume();
          break;
        case stop:
          lifeCall.onStop();
          break;
        case pause:
          lifeCall.onPause();
          break;
        case destroy:
          lifeCall.onDestroy();
          break;
        case didFinishLaunchingWithOptions:
          lifeCall.didFinishLaunchingWithOptions();
          break;
        case applicationWillResignActive:
          lifeCall.applicationWillResignActive();
          break;
        case applicationDidEnterBackground:
          lifeCall.applicationDidEnterBackground();
          break;
        case applicationWillEnterForeground:
          lifeCall.applicationWillEnterForeground();
          break;
        case applicationDidBecomeActive:
          lifeCall.applicationDidBecomeActive();
          break;
        case applicationWillTerminate:
          lifeCall.applicationWillTerminate();
          break;
        default:
          break;
      }
    });
  }
}
