#import "TFRestaurantRecordViewFlowLayout.h"

@implementation TFRestaurantRecordViewFlowLayout

- (instancetype)init {
    self = [super init];

    if (self) {
        self.headerReferenceSize = CGSizeMake(0, 200);
    }

    return self;
}

@end