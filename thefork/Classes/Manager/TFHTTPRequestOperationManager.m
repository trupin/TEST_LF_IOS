#import "TFHTTPRequestOperationManager.h"
#import "TFConfiguration.h"

@implementation TFHTTPRequestOperationManager

#pragma mark - Init

+ (TFHTTPRequestOperationManager *)instance {
    static TFHTTPRequestOperationManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:[TFConfiguration APIEndpoint]]];

    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }

    return self;
}

@end