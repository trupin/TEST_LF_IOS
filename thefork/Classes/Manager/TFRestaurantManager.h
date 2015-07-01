#import <Foundation/Foundation.h>

@class BFTask;

@interface TFRestaurantManager : NSObject

+ (TFRestaurantManager *)instance;

- (BFTask *)getRestaurantWithRemoteId:(NSNumber *)remoteId;

@end