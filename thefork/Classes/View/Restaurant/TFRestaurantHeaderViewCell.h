#import <Foundation/Foundation.h>

@class TFRestaurant;
@class TFRestaurantHeaderViewCell;
@class TFRestaurantHeaderBarButton;

typedef NS_ENUM(NSInteger, TFRestaurantHeaderViewCellBarState) {
    TFRestaurantHeaderViewCellBarStatePictures = 0,
    TFRestaurantHeaderViewCellBarStateReviews = 1,
    TFRestaurantHeaderViewCellBarStateMap = 2
};

@protocol TFRestaurantHeaderViewCellDelegate

- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell
        didTapBarButtonWithState:(TFRestaurantHeaderViewCellBarState)state;

@end

@interface TFRestaurantHeaderViewCell : UICollectionReusableView

@property (nonatomic, weak) id<TFRestaurantHeaderViewCellDelegate> delegate;

- (void)updateWithRestaurant:(TFRestaurant *)restaurant;

@end