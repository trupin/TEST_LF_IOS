#import <Foundation/Foundation.h>

@class BFTask;

@interface TFRestaurant : NSManagedObject

@property (nonatomic, retain) NSNumber *remoteId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *gpsLatitude;
@property (nonatomic, retain) NSNumber *gpsLongitude;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *zipCode;
@property (nonatomic, retain) NSNumber *rateCount;
@property (nonatomic, retain) NSString *currencyCode;
@property (nonatomic, retain) NSNumber *minPrice;
@property (nonatomic, retain) NSString *speciality;
@property (nonatomic, retain) NSNumber *averageRate;
@property (nonatomic, retain) NSString *mainPictureUrl;

@property (nonatomic, retain) NSSet *diaporamaPictures;

+ (TFRestaurant *)importEnsuringUniqueness:(NSDictionary *)dict inContext:(NSManagedObjectContext *)context;

@end