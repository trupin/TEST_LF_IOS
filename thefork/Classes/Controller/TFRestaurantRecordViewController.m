#import "TFRestaurantRecordViewController.h"
#import "TFRestaurantManager.h"
#import "BFTask.h"

@interface TFRestaurantRecordViewController ()

@end

@implementation TFRestaurantRecordViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [[[TFRestaurantManager instance] getRestaurantWithRemoteId:@6861] continueWithSuccessBlock:^id(BFTask *task) {

        return nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end