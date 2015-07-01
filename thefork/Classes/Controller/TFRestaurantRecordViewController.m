#import "TFRestaurantRecordViewController.h"
#import "TFRestaurant.h"
#import "TFRestaurantHeaderViewCell.h"
#import "TFRestaurantRecordViewFlowLayout.h"
#import "TFRestaurantRateViewCell.h"

@interface TFRestaurantRecordViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TFRestaurantHeaderViewCellDelegate>

@property(nonatomic, strong) TFRestaurant *restaurant;

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

    [self.collectionView registerClass:[TFRestaurantRateViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([TFRestaurantRateViewCell class])];

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
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TFRestaurantRateViewCell class]) forIndexPath:indexPath];

    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TFRestaurantHeaderViewCell *cell = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                   withReuseIdentifier:NSStringFromClass([TFRestaurantHeaderViewCell class])
                                                                                          forIndexPath:indexPath];
        cell.delegate = self;
        [cell updateWithRestaurant:self.restaurant];
        return cell;
    }
    return nil;
}

#pragma mark - TFRestaurantHeaderViewCellDelegate

- (void)restaurantHeaderViewCell:(TFRestaurantHeaderViewCell *)restaurantHeaderViewCell didTapBarButtonWithState:(TFRestaurantHeaderViewCellSelectedBarState *)state {

}

@end