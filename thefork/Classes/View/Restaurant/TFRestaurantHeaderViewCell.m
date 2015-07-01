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

@property(nonatomic, strong) NSArray *barButtons;

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

        TFRestaurantHeaderBarButton *picturesBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        picturesBarButton.tag = TFRestaurantHeaderViewCellBarStatePictures;
        [picturesBarButton setTitle:NSLocalizedString(@"PICTURE_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [picturesBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:picturesBarButton];

        TFRestaurantHeaderBarButton *reviewsBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        reviewsBarButton.tag = TFRestaurantHeaderViewCellBarStateReviews;
        [reviewsBarButton setTitle:NSLocalizedString(@"REVIEWS_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [reviewsBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [reviewsBarButton setSelected:YES];
        [self addSubview:reviewsBarButton];

        TFRestaurantHeaderBarButton *mapBarButton = [TFRestaurantHeaderBarButton buttonWithType:UIButtonTypeRoundedRect];
        mapBarButton.tag = TFRestaurantHeaderViewCellBarStateMap;
        [mapBarButton setTitle:NSLocalizedString(@"MAP_BAR_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        [mapBarButton addTarget:self action:@selector(didTapBarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mapBarButton];

        self.barButtons = @[picturesBarButton, reviewsBarButton, mapBarButton];
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

        for (UIButton *button in self.barButtons) {
            [button autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
            [button autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        }

        [self.barButtons autoDistributeViewsAlongAxis:ALAxisBaseline
                                       alignedTo:ALAttributeBaseline
                                withFixedSpacing:0];
    }
    [super updateConstraints];
}

#pragma mark - Public methods

- (void)updateWithRestaurant:(TFRestaurant *)restaurant {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:restaurant.mainPictureUrl]];
    self.nameLabel.text = restaurant.name;
    self.addressLabel.text = [NSString stringWithFormat:@"%@, %@, %@", restaurant.address, restaurant.zipCode, restaurant.city];
}

#pragma mark - Private methods

- (void)didTapBarButton:(TFRestaurantHeaderBarButton *)view {
    for (UIButton *button in self.barButtons)
        [button setSelected:[button isEqual:view]];

    [self.delegate restaurantHeaderViewCell:self
                   didTapBarButtonWithState:(TFRestaurantHeaderViewCellBarState) view.tag];
}

@end