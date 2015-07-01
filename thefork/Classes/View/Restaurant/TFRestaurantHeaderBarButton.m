#import "TFRestaurantHeaderBarButton.h"
#import "UIImage+TFUtil.h"

@implementation TFRestaurantHeaderBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];

        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor]] forState:UIControlStateSelected];

        [self setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor]] forState:UIControlStateHighlighted];
    }

    return self;
}

@end