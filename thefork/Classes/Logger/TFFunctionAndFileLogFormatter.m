#import "TFFunctionAndFileLogFormatter.h"

@interface TFFunctionAndFileLogFormatter ()
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage;
@end

@implementation TFFunctionAndFileLogFormatter

#pragma mark - DDLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel = nil;
    if (logMessage.level == DDLogFlagError)
        logLevel = @"E";
    else if (logMessage.level == DDLogFlagWarning)
        logLevel = @"W";
    else if (logMessage.level == DDLogFlagInfo)
        logLevel = @"I";
    else
        logLevel = @"V";

    return [NSString stringWithFormat:@"[%@][%@ %@][Line %lu] %@",
                                      logLevel,
                                      logMessage.fileName,
                                      logMessage.function,
                                      (unsigned long) logMessage.line,
                                      logMessage.message];
}

@end