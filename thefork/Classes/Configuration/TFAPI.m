#import "TFAPI.h"
#import "TFConfiguration.h"

@implementation TFAPI

+ (NSString *)restaurantGetInfoWithRemoteId:(NSNumber *)remoteId {
    return [TFConfiguration route:[NSString stringWithFormat:@"?key=IPHONEPRODEDCRFV&method=restaurant_get_info&id_restaurant=%@", remoteId]];
}

@end