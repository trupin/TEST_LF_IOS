#import <PureLayout/ALView+PureLayout.h>
#import "TFRestaurantPictureViewCell.h"
#import "UIImageView+WebCache.h"
#import "TFPicture.h"

@interface TFRestaurantPictureViewCell ()

@property(nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TFRestaurantPictureViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;

        [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero];
    }
    [super updateConstraints];
}

#pragma mark - Public methods

- (void)updateWithPicture:(TFPicture *)picture {
    NSURL *imageURL = [NSURL URLWithString:picture.url];
    [self.imageView sd_setImageWithURL:imageURL];
}

@end