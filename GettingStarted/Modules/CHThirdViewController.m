//
//  CHThirdViewController.m
//  GettingStarted
//
//  Created by Moch on 8/23/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import "CHThirdViewController.h"
#import "UIScrollView+RefreshControl.h"

@interface CHThirdViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CHThirdViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 19; i++) {
        NSString *data = [NSString stringWithFormat:@"initial data number: %d", i];
        [_dataSource addObject:data];
    }
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addTopRefreshControlUsingBlock:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (int i = 0; i < 5; i++) {
                NSString *data = [NSString stringWithFormat:@"pull down data random number: %d", arc4random() % 100];
                [weakSelf.dataSource insertObject:data atIndex:0];
            }
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView topRefreshControlStopRefreshing];
        });
    }  refreshControlPullType:RefreshControlPullTypeInsensitive];
    
    [self.tableView addBottomRefreshControlUsingBlock:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (int i = 0; i < 5; i++) {
                NSString *data = [NSString stringWithFormat:@"pull up data random number: %d", arc4random() % 100];
                [weakSelf.dataSource addObject:data];
            }
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView bottomRefreshControlStopRefreshing];
            
        });
    } refreshControlPullType:RefreshControlPullTypeInsensitive];
    
    //    self.tableView.topRefreshControlPullToRefreshingText = @"下拉刷新";
    //    self.tableView.statusTextColor = [UIColor redColor];
    //    self.tableView.loadingCircleColor = [UIColor orangeColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}

@end
