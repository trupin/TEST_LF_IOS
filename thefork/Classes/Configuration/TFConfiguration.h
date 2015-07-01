#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const kTFConfigurationApiEndPoint;
FOUNDATION_EXPORT NSString *const kTFConfigurationGMapsApiKey;

@interface TFConfiguration : NSObject

+ (TFConfiguration *)sharedConfiguration;

+ (NSString *)APIEndpoint;
+ (NSString *)route: (NSString *)routeString;

+ (NSString *)GMapsApiKey;
@end
