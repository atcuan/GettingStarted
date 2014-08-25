//
//  CHViewController.m
//  GettingStarted
//
//  Created by Moch on 8/17/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import "CHViewController.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "LocationPickerView.h"
#import "NSString+TextSize.h"
#import "UIView+Animation.h"

@interface CHViewController () <CHLocationPickerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selectAddressButton;

@end

@implementation CHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.selectAddressButton.backgroundColor = [UIColor colorWithRGBA:@[@245, @232, @8, @1]];
//    CHRGBColor(245, 232, 8, 1);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [UIView toastWithMessage:@"用户名错误"];
//    [self loadingAnimation];

}

- (void)showMessage:(NSString *)message
{
    [SVProgressHUD showWithStatus:message];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // time-consuming task
        sleep(1.5);
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    });
}

- (IBAction)handleSelectAddress:(UIButton *)sender {
//    LocationPickerView *locationPickerView = [[LocationPickerView alloc] initWithLocationPickerType:CHLocationPickerTypeCites selectedItem:^(NSString *item) {
//        [self.selectAddressButton setTitle:item forState:UIControlStateNormal];
//    }];
//    [locationPickerView showInView:self.view];
    [self.view removeLoadingAnimation];
}

- (void)loadingAnimation {
    [self.view addLoadingAnimation];
}

@end
