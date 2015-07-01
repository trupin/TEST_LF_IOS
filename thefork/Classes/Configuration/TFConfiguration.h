#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const kTFConfigurationApiEndPoint;

@interface TFConfiguration : NSObject

+ (TFConfiguration *)sharedConfiguration;

+ (NSString *)APIEndpoint;
+ (NSString *)route: (NSString *)routeString;

@end
