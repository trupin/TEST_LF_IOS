#import <Foundation/Foundation.h>

@class TFRestaurant;

@interface TFPicture : NSManagedObject

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *url;

@property (nonatomic, retain) TFRestaurant *restaurant;

+ (TFPicture *)importEnsuringUniqueness:(NSDictionary *)data inContext:(NSManagedObjectContext *)context withRestaurant:(TFRestaurant *)restaurant;

@end