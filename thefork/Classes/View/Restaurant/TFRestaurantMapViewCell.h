#import <Foundation/Foundation.h>

@class TFRestaurant;

@interface TFRestaurantMapViewCell : UICollectionViewCell
- (void)updateWithRestaurant:(TFRestaurant *)restaurant;
@end