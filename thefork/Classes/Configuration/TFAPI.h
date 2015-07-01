#import <Foundation/Foundation.h>

@class TFConfiguration;

@interface TFAPI : NSObject

+ (NSString *)restaurantGetInfoWithRemoteId:(NSNumber *)remoteId;

@end