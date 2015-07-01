#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "TFRequestManager.h"
#import "BFTaskCompletionSource.h"
#import "TFHTTPRequestOperationManager.h"

@implementation TFRequestManager

#pragma mark - Init

+ (TFRequestManager *)instance {
    static TFRequestManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

#pragma mark - Public methods

- (BFTask *)GET:(NSString *)route withParameters:(NSDictionary *)parameters {
    __block BFTaskCompletionSource *promise = [BFTaskCompletionSource taskCompletionSource];

    [TFHTTPRequestOperationManager.instance GET:route parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.operation = operation;
        [promise setResult:responseObject];
    }                                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.operation = operation;

        [promise setError:error];
    }];

    return promise.task;
}

@end