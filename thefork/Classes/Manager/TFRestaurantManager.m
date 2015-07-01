#import "TFRestaurantManager.h"
#import "BFTask.h"
#import "TFRequestManager.h"
#import "TFAPI.h"
#import "TFRestaurant.h"

@implementation TFRestaurantManager

+ (TFRestaurantManager *)instance {
    static TFRestaurantManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (BFTask *)getRestaurantWithRemoteId:(NSNumber *)remoteId {
    BFTask *request = [[TFRequestManager instance] GET:[TFAPI restaurantGetInfoWithRemoteId:remoteId]
                                             withParameters:nil];

    return [request continueWithSuccessBlock:^id(BFTask *task) {
        NSDictionary *data = task.result[@"data"];

        NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];

        TFRestaurant *restaurant = [TFRestaurant importEnsuringUniqueness:data inContext:context];

        [context MR_saveToPersistentStoreAndWait];

        return restaurant;
    }];
}

@end