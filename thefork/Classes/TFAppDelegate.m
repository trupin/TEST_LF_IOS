#import "TFAppDelegate.h"
#import "TFFunctionAndFileLogFormatter.h"

@interface TFAppDelegate ()

@end

@implementation TFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setupLogger];
    [self setupMagicalRecord];

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

@end