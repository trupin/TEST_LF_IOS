#import <PureLayout/PureLayoutDefines.h>
#import <PureLayout/ALView+PureLayout.h>
#import "TFRestaurantMapViewCell.h"
#import "TFRestaurant.h"
#import "GoogleMaps/GoogleMaps.h"

@interface TFRestaurantMapViewCell ()

@property(nonatomic, assign) BOOL didSetupConstraints;

@property(nonatomic, strong) GMSMapView *mapView;

@end

@implementation TFRestaurantMapViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                                longitude:151.2086
                                                                     zoom:6];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        [self addSubview:self.mapView];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;

        [self.mapView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero];
    }
    [super updateConstraints];
}

#pragma mark - Public methods

- (void)updateWithRestaurant:(TFRestaurant *)restaurant {
}

@end