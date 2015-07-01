#import <FontAwesomeKit/FAKFontAwesome.h>
#import "TFRestaurantHeaderViewCell.h"
#import "ALView+PureLayout.h"
#import "TFRestaurant.h"
#import "UIImageView+WebCache.h"
#import "TFRestaurantHeaderLabel.h"
#import "FAKIonIcons.h"
#import "NSArray+PureLayout.h"
#import "TFRestaurantHeaderBarButton.h"

@interface TFRestaurantHeaderViewCell ()

@property(nonatomic, assign) BOOL didSetupConstraints;

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIButton *backButton;
@property(nonatomic, strong) UIButton *shareButton;
@property(nonatomic, strong) UIButton *likeButton;
@property(nonatomic, strong) TFRestaurantHeaderLabel *nameLabel;
@property(nonatomic, strong) TFRestaurantHeaderLabel *addressLabel;

@property(nonatomic, strong) TFRestaurantHeaderBarButton *picturesBarButton;
@property(nonatomic, strong) TFRestaurantHeaderBarButton *reviewsBarButton;
@property(nonatomic, strong) TFRestaurantHeaderBarButton *mapBarButton;

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


        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backButton setAttributedTitle:[FAKIonIcons iosArrowLeftIconWithSize:40].attributedString forState:UIControlStateNormal];
        self.backButton.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.backButton];

        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareButton setAttributedTitle:[FAKIonIcons iosUploadIconWithSize:40].attributedString forState:UIControlStateNormal];
        self.shareButton.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.shareButton];

        self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.likeButton setAttributedTitle:[FAKIonIcons iosHeartOutlineIconWithSize:35].attributedString forState:UIControlStateNormal];
        self.likeButton.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.likeButton];


        self.nameLabel = [TFRestaurantHeaderLabel new];
        self.nameLabel.font = [self.nameLabel.font fontWithSize:30];
        [self addSubview:self.nameLabel];

        self.addressLabel = [TFRestaurantHeaderLabel new];
        self.addressLabel.font = [self.addressLabel.font fontWithSize:15];
        [self addSubview:self.addressLabel];


        self.picturesBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        [self.picturesBarButton setTitle:NSLocalizedString(@"PICTURE_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [self.picturesBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.picturesBarButton];

        self.reviewsBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        [self.reviewsBarButton setTitle:NSLocalizedString(@"REVIEWS_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [self.reviewsBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.reviewsBarButton];

        self.mapBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        [self.mapBarButton setTitle:NSLocalizedString(@"MAP_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [self.mapBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.mapBarButton];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;

        [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 70, 0)];

        [self.backButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imageView withOffset:20];
        [self.backButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.imageView withOffset:20];

        [self.shareButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.imageView withOffset:-10];
        [self.shareButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.imageView withOffset:20];

        [self.likeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.imageView withOffset:-10];
        [self.likeButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.imageView withOffset:-10];

        [self.nameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.addressLabel withOffset:-2];
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imageView withOffset:20];

        [self.addressLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.imageView withOffset:-20];
        [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imageView withOffset:20];

        [self.picturesBarButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
        [self.picturesBarButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];

        [self.reviewsBarButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
        [self.reviewsBarButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];

        [self.mapBarButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
        [self.mapBarButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];

        NSArray *barButtons = @[self.picturesBarButton, self.reviewsBarButton, self.mapBarButton];
        [barButtons autoDistributeViewsAlongAxis:ALAxisBaseline
                                       alignedTo:ALAttributeBaseline
                                withFixedSpacing:0];
    }
    [super updateConstraints];
}

- (void)updateWithRestaurant:(TFRestaurant *)restaurant {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:restaurant.mainPictureUrl]];
    self.nameLabel.text = restaurant.name;
    self.addressLabel.text = [NSString stringWithFormat:@"%@, %@, %@", restaurant.address, restaurant.zipCode, restaurant.city];
}

#pragma mark - Private methods

- (void)didTapBarButton:(TFRestaurantHeaderBarButton *)view {
    for (UIButton *button in @[self.picturesBarButton, self.reviewsBarButton, self.mapBarButton])
        [button setSelected:[button isEqual:view]];

    if ([view isEqual:self.picturesBarButton])
        [self.delegate restaurantHeaderViewCell:self didTapMapBarButton:self.picturesBarButton];
    else if ([view isEqual:self.reviewsBarButton])
        [self.delegate restaurantHeaderViewCell:self didTapReviewsBarButton:self.reviewsBarButton];
    else if ([view isEqual:self.mapBarButton])
        [self.delegate restaurantHeaderViewCell:self didTapReviewsBarButton:self.mapBarButton];
    else
        DDLogWarn(@"This condition shouldn't happen. Probably a bug you should fix.");
}

@end