#include "TFConfiguration.h"

NSString *const kTFConfigurationApiEndPoint = @"ApiEndPoint";

@interface TFConfiguration ()

@property(readonly, copy, nonatomic) NSString *configuration;
@property(copy, nonatomic) NSDictionary *variables;

- (id)init;

@end

@implementation TFConfiguration

#pragma mark - Init

+ (TFConfiguration *)sharedConfiguration {
    static TFConfiguration *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (id)init {
    self = [super init];

    if (self) {
        NSBundle *mainBundle = [NSBundle mainBundle];

#ifdef EC_PRODUCTION
        _configuration = @"Production";
#else
        _configuration = @"Staging";
#endif
        if ([[NSProcessInfo processInfo] environment][@"TF_ENV"])
            _configuration = [[NSProcessInfo processInfo] environment][@"TF_ENV"];

        if (!_configuration)
            _configuration = [mainBundle infoDictionary][@"Configuration"];

        if (!_configuration)
            @throw [NSException exceptionWithName:@"Bad configuration." reason:@"Cannot find configuration type." userInfo:nil];

        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];

        _variables = configurations[_configuration];
    }

    return self;
}

+ (NSString *)APIEndpoint {
    if ([[NSProcessInfo processInfo] environment][@"TF_API_END_POINT"])
        return [[NSProcessInfo processInfo] environment][@"TF_API_END_POINT"];

    TFConfiguration *sharedConfiguration = [TFConfiguration sharedConfiguration];

    if (sharedConfiguration.variables) {
        NSString *endPoint = (sharedConfiguration.variables)[kTFConfigurationApiEndPoint];
        if (!endPoint)
            @throw [NSException exceptionWithName:@"Bad configuration" reason:@"Host or Port variables are missing." userInfo:nil];
        return endPoint;
    }

    return nil;
}

+ (NSString *)route:(NSString *)routeString {
    return [[TFConfiguration APIEndpoint] stringByAppendingString:routeString];
}

@end
