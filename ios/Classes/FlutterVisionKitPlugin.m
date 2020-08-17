#import "FlutterVisionKitPlugin.h"
#if __has_include(<flutter_vision_kit/flutter_vision_kit-Swift.h>)
#import <flutter_vision_kit/flutter_vision_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_vision_kit-Swift.h"
#endif

@implementation FlutterVisionKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterVisionKitPlugin registerWithRegistrar:registrar];
}
@end
