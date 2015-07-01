#import <Foundation/Foundation.h>
#import <Bolts/BFTask.h>
#import <AFNetworking/AFHTTPRequestOperation.h>

@class BFTask;

@interface TFRequestManager : NSObject

@property (nonatomic, weak) AFHTTPRequestOperation *operation;

+ (TFRequestManager *)instance;

- (BFTask *)GET:(NSString *)route withParameters:(NSDictionary *)parameters;

@end