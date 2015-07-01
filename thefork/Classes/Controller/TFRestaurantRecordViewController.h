#import <UIKit/UIKit.h>

@class TFRestaurant;

@interface TFRestaurantRecordViewController : UICollectionViewController

- (instancetype)initWithRestaurant:(TFRestaurant *)restaurant;
+ (instancetype)controllerWithRestaurant:(TFRestaurant *)restaurant;

@end
