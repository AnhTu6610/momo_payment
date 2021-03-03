#import "MomoPaymentPlugin.h"
#if __has_include(<momo_payment/momo_payment-Swift.h>)
#import <momo_payment/momo_payment-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "momo_payment-Swift.h"
#endif

@implementation MomoPaymentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMomoPaymentPlugin registerWithRegistrar:registrar];
}
@end
