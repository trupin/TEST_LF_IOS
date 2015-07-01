#import "TFRestaurantHeaderViewCell.h"
#import "ALView+PureLayout.h"
#import "TFRestaurant.h"
#import "UIImageView+WebCache.h"

@interface TFRestaurantHeaderViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation TFRestaurantHeaderViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];

        self.nameLabel = [UILabel new];
        self.nameLabel.backgroundColor = [UIColor blackColor];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.nameLabel];

        self.addressLabel = [UILabel new];
        self.addressLabel.backgroundColor = [UIColor blackColor];
        self.addressLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.addressLabel];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;

        [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero];

        [self.nameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.addressLabel];
        [self.addressLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.imageView];
    }
    [super updateConstraints];
}

- (void)updateWithRestaurant:(TFRestaurant *)restaurant {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:restaurant.mainPictureUrl]];
    self.nameLabel.text = restaurant.name;
    self.addressLabel.text = restaurant.address;
}

@end