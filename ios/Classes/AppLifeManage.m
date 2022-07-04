#import "AppLifeManage.h"

@implementation AppLifeManage
FlutterMethodChannel* channel;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
      channel = [FlutterMethodChannel
      methodChannelWithName:@"app_life"
            binaryMessenger:[registrar messenger]];
  AppLifeManage* instance = [[AppLifeManage alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

+ (void)registerLife :(NSString *)type{
    [channel invokeMethod:type arguments:NULL];
}
@end
