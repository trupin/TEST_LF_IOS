#import <PureLayout/PureLayoutDefines.h>
#import <PureLayout/ALView+PureLayout.h>
#import "TFRestaurantMapViewCell.h"
#import "TFRestaurant.h"
#import "GoogleMaps/GoogleMaps.h"

@interface TFRestaurantMapViewCell ()

@property(nonatomic, assign) BOOL didSetupConstraints;

@property(nonatomic, strong) UILabel *placeDescription;
@property(nonatomic, strong) GMSMapView *mapView;

@end

@implementation TFRestaurantMapViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:48.8534100
                                                                longitude:2.3488000
                                                                     zoom:10];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        [self addSubview:self.mapView];

        self.placeDescription = [UILabel new];
        [self addSubview:self.placeDescription];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;

        [self.placeDescription autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.placeDescription autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.placeDescription autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.placeDescription autoSetDimension:ALDimensionHeight toSize:60];

        [self.mapView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.mapView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.mapView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.mapView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.placeDescription];
    }
    [super updateConstraints];
}

#pragma mark - Public methods

- (void)updateWithRestaurant:(TFRestaurant *)restaurant {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[restaurant.gpsLatitude floatValue]
                                                            longitude:[restaurant.gpsLongitude floatValue]
                                                                 zoom:15];
    [self.mapView setCamera:camera];

    GMSMarker *marker = [GMSMarker new];
    marker.position = camera.target;
    marker.snippet = restaurant.name;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = self.mapView;

    self.placeDescription.text = [NSString stringWithFormat:
            NSLocalizedString(@"RESTAURANT_MAP_VIEW_CELL_PLACE_DESCRIPTION", nil),
            restaurant.speciality,
            restaurant.minPrice,
            restaurant.currencyCode
    ];
}

@end