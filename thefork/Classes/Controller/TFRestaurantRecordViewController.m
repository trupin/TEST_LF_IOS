#import "TFRestaurantRecordViewController.h"
#import "TFRestaurant.h"
#import "TFRestaurantHeaderViewCell.h"
#import "TFRestaurantRecordViewFlowLayout.h"
#import "TFRestaurantReviewViewCell.h"
#import "TFRestaurantPictureViewCell.h"
#import "TFPicture.h"
#import "TFRestaurantMapViewCell.h"

@interface TFRestaurantRecordViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TFRestaurantHeaderViewCellDelegate>

@property(nonatomic, strong) TFRestaurant *restaurant;
@property(nonatomic, assign) TFRestaurantHeaderViewCellBarState headerBarState;

@end

@implementation TFRestaurantRecordViewController

- (instancetype)initWithRestaurant:(TFRestaurant *)restaurant {
    self = [super initWithCollectionViewLayout:[TFRestaurantRecordViewFlowLayout new]];

    if (self) {
        self.restaurant = restaurant;
    }

    return self;
}

+ (instancetype)controllerWithRestaurant:(TFRestaurant *)restaurant {
    return [[self alloc] initWithRestaurant:restaurant];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.headerBarState = TFRestaurantHeaderViewCellBarStateReviews;

    [self.collectionView registerClass:[TFRestaurantPictureViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([TFRestaurantPictureViewCell class])];

    [self.collectionView registerClass:[TFRestaurantReviewViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([TFRestaurantReviewViewCell class])];

    [self.collectionView registerClass:[TFRestaurantMapViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([TFRestaurantMapViewCell class])];

    [self.collectionView registerClass:[TFRestaurantHeaderViewCell class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:NSStringFromClass([TFRestaurantHeaderViewCell class])];

    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (self.headerBarState) {
        case TFRestaurantHeaderViewCellBarStatePictures:
            return [self.restaurant.diaporamaPictures count];
        case TFRestaurantHeaderViewCellBarStateReviews:
            return 100;
        case TFRestaurantHeaderViewCellBarStateMap:
            return 1;
        default:
            return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.headerBarState) {
        case TFRestaurantHeaderViewCellBarStatePictures: {
            TFRestaurantPictureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TFRestaurantPictureViewCell class]) forIndexPath:indexPath];

            TFPicture *picture = self.restaurant.diaporamaPictures.allObjects[(NSUInteger) indexPath.item];
            [cell updateWithPicture:picture];

            return cell;
        }
        case TFRestaurantHeaderViewCellBarStateReviews: {
            TFRestaurantReviewViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TFRestaurantReviewViewCell class]) forIndexPath:indexPath];

            return cell;
        }
        case TFRestaurantHeaderViewCellBarStateMap: {
            TFRestaurantMapViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TFRestaurantMapViewCell class]) forIndexPath:indexPath];
            [cell updateWithRestaurant:self.restaurant];

            return cell;
        }
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.headerBarState) {
        case TFRestaurantHeaderViewCellBarStatePictures:
            return CGSizeMake(100, 100);
        case TFRestaurantHeaderViewCellBarStateReviews:
            return CGSizeMake(self.collectionView.bounds.size.width, 50);
        case TFRestaurantHeaderViewCellBarStateMap:
            return CGSizeMake(
                    self.collectionView.bounds.size.width,
                    self.collectionView.bounds.size.height - 270
            );
        default:
            return CGSizeMake(0, 0);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TFRestaurantHeaderViewCell *cell = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                   withReuseIdentifier:NSStringFromClass([TFRestaurantHeaderViewCell class])
                                                                                          forIndexPath:indexPath];
        [cell updateWithRestaurant:self.restaurant];
        cell.delegate = self;
        return cell;
    }
    return nil;
}

#pragma mark - TFRestaurantHeaderViewCellDelegate

- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell didTapBarButtonWithState:(TFRestaurantHeaderViewCellBarState)state {
    self.headerBarState = state;

    [self.collectionView reloadData];
}

@end