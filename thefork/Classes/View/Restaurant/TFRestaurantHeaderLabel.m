#import <PureLayout/PureLayoutDefines.h>
#import <PureLayout/ALView+PureLayout.h>
#import "TFRestaurantHeaderLabel.h"

@interface TFRestaurantHeaderLabel ()

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end

@implementation TFRestaurantHeaderLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.edgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.textColor = [UIColor whiteColor];
    }

    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

- (CGSize)intrinsicContentSize
{
    CGSize size = [super intrinsicContentSize];
    size.width  += self.edgeInsets.left + self.edgeInsets.right;
    size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return size;
}

@end