Native lifecycle functions that support iOS and Android, different from WidgetBindings that come with Flutter
Android/IOS native life cycle

* 原生的生命周期函数，支持 iOS 和 Android，不同于 flutter 中自带的 WidgetBindings  Android/IOS原生生命周期

## android 生命周期
* ON_CREATE    onCreate
* ON_START     onStart
* ON_RESTART   onRestart
* ON_RESUME    onResume
* ON_STOP      onStop
* ON_PAUSE     onPause
* ON_DESTROY   onestroy

## ios生命周期
* DID_FINISH_LAUNCHING_WITH_OPTIONS  didFinishLaunchingWithOptions
* APPLICATION_WILL_RESIGN_ACTIVE     applicationWillResignActive
* APPLICATION_DID_ENTER_BACKGROUND   applicationDidEnterBackground
* APPLICATION_WILL_ENTER_FOREGROUND  applicationWillEnterForeground
* APPLICATION_DID_BECOME_ACTIVE      applicationDidBecomeActive
* APPLICATION_WILL_TERMINATE         applicationWillTerminate


## 注册生命周期函数
* (android) AppLifeManage.registerLife(AppLifeManage.LifeEnum.ON_CREATE);
* (ios)   [AppLifePlugin registerLife:DID_FINISH_LAUNCHING_WITH_OPTIONS];


* android
```java
public class MainActivity extends FlutterActivity {
    private  static String TAG=MainActivity.class.getName();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //注册对应的生命周期函数
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
```

* ios
* 引入头文件  #import "AppLifePlugin.h"
```c#
@implementation AppDelegate
 /**
 应用创建
 */
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    NSLog(@"%@", @"didFinishLaunchingWithOptions: 应用创建");
    [AppLifePlugin registerLife:DID_FINISH_LAUNCHING_WITH_OPTIONS];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

/**
 应用从活动状态进入非活动状态，如从应用切换到桌面
 */
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"%@", @"applicationWillResignActive:应用从活动状态进入非活动状态");
    [AppLifePlugin registerLife:APPLICATION_WILL_RESIGN_ACTIVE];
}

/**
 应用处于后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"%@", @"applicationDidEnterBackground:应用处于后台");
    [AppLifePlugin registerLife:APPLICATION_DID_ENTER_BACKGROUND];
}

/**
 应用进入前台，但还没有处于活动状态
 */
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"%@", @"applicationWillEnterForeground:应用进入前台，但还没有处于活动状态");
    [AppLifePlugin registerLife:APPLICATION_WILL_ENTER_FOREGROUND];
}
/**
 应用处于前台并且活动状态
 */
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"%@", @"applicationDidBecomeActive: 应用处于前台并且活动状态");
    [AppLifePlugin registerLife:APPLICATION_DID_BECOME_ACTIVE];
}

/**
 应用终止，销毁
 */
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"%@", @"applicationWillTerminate:应用终止，销毁");
    [AppLifePlugin registerLife:APPLICATION_WILL_TERMINATE];
}
@end
```

* flutter
* 1）with LifeManageCall
* 2）  @override
        void initState() {
            super.initState();
            LifeManage.instance!.addObserver(this);
        }

```dart
class WithTestPage extends StatefulWidget {
  const WithTestPage({Key? key}) : super(key: key);

  @override
  _WithTestPageState createState() => _WithTestPageState();
}

class _WithTestPageState extends State<WithTestPage> with LifeManageCall {
  @override
  void initState() {
    super.initState();
    LifeManage.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WithTest'),
        ),
        body: Center(
          child: Column(),
        ));
  }

  @override
  void onCreate() {
    print("onCreate=============");
  }

  @override
  void onRestart() {
    print("onRestart=============");
  }

  @override
  void applicationDidBecomeActive() {
    print("applicationDidBecomeActive=============");
  }

  @override
  void applicationDidEnterBackground() {
    print("applicationDidEnterBackground=============");
  }
}
```
