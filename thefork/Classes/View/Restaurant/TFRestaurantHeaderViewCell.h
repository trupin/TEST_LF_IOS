#import <Foundation/Foundation.h>

@class TFRestaurant;
@class TFRestaurantHeaderViewCell;
@class TFRestaurantHeaderBarButton;

typedef NS_ENUM(NSInteger, TFRestaurantHeaderViewCellSelectedBarState) {
    TFRestaurantHeaderViewCellSelectedBarStatePictures = 0,
    TFRestaurantHeaderViewCellSelectedBarStateReviews = 1,
    TFRestaurantHeaderViewCellSelectedBarStateMap = 2
};

@protocol TFRestaurantHeaderViewCellDelegate

- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell
        didTapBarButtonWithState:(TFRestaurantHeaderViewCellSelectedBarState *)state;

@end

@interface TFRestaurantHeaderViewCell : UICollectionReusableView

@property (nonatomic, weak) id<TFRestaurantHeaderViewCellDelegate> delegate;

- (void)updateWithRestaurant:(TFRestaurant *)restaurant;

@end