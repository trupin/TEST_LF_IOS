#import "TFAppDelegate.h"
#import "TFFunctionAndFileLogFormatter.h"
#import "TFRestaurantManager.h"
#import "BFTask.h"
#import "TFRestaurantRecordViewController.h"

@interface TFAppDelegate ()

@end

@implementation TFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setupLogger];
    [self setupMagicalRecord];
    [self setupWindow];

    return YES;
}

#pragma mark - Private methods

- (void)setupMagicalRecord {
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelVerbose];
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:appVersion];
}

- (void)setupLogger {
    DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];
    [ttyLogger setLogFormatter:[TFFunctionAndFileLogFormatter new]];
}

- (void)setupWindow {

    [[[TFRestaurantManager instance] getRestaurantWithRemoteId:@6861] continueWithSuccessBlock:^id(BFTask *task) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        self.window.rootViewController = [TFRestaurantRecordViewController controllerWithRestaurant:task.result];
        [self.window makeKeyAndVisible];
        return nil;
    }];
}

@end