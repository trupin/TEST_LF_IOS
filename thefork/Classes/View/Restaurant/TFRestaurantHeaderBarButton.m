#import "TFRestaurantHeaderBarButton.h"
#import "UIImage+TFUtil.h"
#import "UIColor+TFUtil.h"

@implementation TFRestaurantHeaderBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor TF_snow]] forState:UIControlStateNormal];

        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor TF_darkSeaGreen]] forState:UIControlStateSelected];

        [self setBackgroundImage:[UIImage imageWithColor:[UIColor TF_darkSeaGreen]] forState:UIControlStateHighlighted];
    }

    return self;
}

@end