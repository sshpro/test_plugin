#import "TestPlugin.h"
@implementation TestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"test_plugin"
            binaryMessenger:[registrar messenger]];
  TestPlugin* instance = [[TestPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"log" isEqualToString:call.method]) {
        NSString *logStr = call.arguments[0];
        NSLog(logStr);
        result(@"success");
    } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
