#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

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
