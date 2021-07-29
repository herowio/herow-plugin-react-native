#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(HerowSdkModule, NSObject)

RCT_EXTERN_METHOD(initialize:(NSString *)herowPlatform
                 withUsername:(NSString *)username
                 withPassword:(NSString *)password)

RCT_EXTERN_METHOD(setCustomId:(NSString *)customId)

RCT_EXTERN_METHOD(removeCustomId)

RCT_EXTERN_METHOD(acceptOptin)

RCT_EXTERN_METHOD(refuseOptin)

RCT_EXTERN_METHOD(launchClickAndCollect)

RCT_EXTERN_METHOD(stopClickAndCollect)

RCT_EXTERN_METHOD(askWhenInUseLocationPermission)

RCT_EXTERN_METHOD(askAlwaysLocationPermission)

RCT_EXTERN_METHOD(askNotificationsPermission)

RCT_EXTERN_METHOD(requestIDFA)
@end
