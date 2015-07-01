#import <Foundation/Foundation.h>

@class TFRestaurant;
@class TFRestaurantHeaderViewCell;
@class TFRestaurantHeaderBarButton;

@protocol TFRestaurantHeaderViewCellDelegate

- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell didTapPicturesBarButton:(TFRestaurantHeaderBarButton *)button;
- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell didTapReviewsBarButton:(TFRestaurantHeaderBarButton *)button;
- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell didTapMapBarButton:(TFRestaurantHeaderBarButton *)button;

@end

@interface TFRestaurantHeaderViewCell : UICollectionReusableView

@property (nonatomic, weak) id<TFRestaurantHeaderViewCellDelegate> delegate;

- (void)updateWithRestaurant:(TFRestaurant *)restaurant;

@end