#import "TFPicture.h"
#import "TFRestaurant.h"

@implementation TFPicture

@dynamic label;
@dynamic url;

@dynamic restaurant;

+ (TFPicture *)importEnsuringUniqueness:(NSDictionary *)data inContext:(NSManagedObjectContext *)context withRestaurant:(TFRestaurant *)restaurant {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"label like %@ AND restaurant == %@" argumentArray:@[data[@"label"], restaurant]];

    TFPicture *picture = [TFPicture MR_findFirstWithPredicate:predicate inContext:context];

    if (!picture)
        picture = [TFPicture MR_createEntityInContext:context];

    picture.restaurant = restaurant;

    if (![picture MR_importValuesForKeysWithObject:data])
        DDLogWarn(@"Couldn't save picture with data: %@", data);

    return picture;
}

@end