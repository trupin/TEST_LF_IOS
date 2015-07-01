#import "TFRestaurant.h"
#import "TFPicture.h"

@implementation TFRestaurant

@dynamic date;

@dynamic remoteId;
@dynamic name;
@dynamic gpsLatitude;
@dynamic gpsLongitude;
@dynamic address;
@dynamic city;
@dynamic zipCode;
@dynamic rateCount;
@dynamic currencyCode;
@dynamic minPrice;
@dynamic speciality;
@dynamic averageRate;
@dynamic mainPictureUrl;

@dynamic diaporamaPictures;

+ (TFRestaurant *)importEnsuringUniqueness:(NSDictionary *)data inContext:(NSManagedObjectContext *)context {
    TFRestaurant *restaurant = [TFRestaurant MR_findFirstByAttribute:@"remoteId" withValue:data[@"id_restaurant"] inContext:context];

    if (!restaurant)
        restaurant = [TFRestaurant MR_createEntityInContext:context];

    NSMutableDictionary *mutableData = [data mutableCopy];

    mutableData[@"mainPictureUrl"] = data[@"pics_main"][@"612x344"];

    NSArray *diapoPictures = data[@"pics_diaporama"];

    for (NSDictionary *pictureData in diapoPictures) {
        [TFPicture importEnsuringUniqueness:pictureData inContext:context withRestaurant:restaurant];
    }

    if (![restaurant MR_importValuesForKeysWithObject:mutableData])
        DDLogWarn(@"Couldn't save restaurant with data: %@", mutableData);

    return restaurant;
}

@end