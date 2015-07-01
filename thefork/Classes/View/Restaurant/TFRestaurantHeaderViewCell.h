#import <Foundation/Foundation.h>

@class TFRestaurant;

@interface TFRestaurantHeaderViewCell : UICollectionReusableView

- (void)updateWithRestaurant:(TFRestaurant *)restaurant;

@end