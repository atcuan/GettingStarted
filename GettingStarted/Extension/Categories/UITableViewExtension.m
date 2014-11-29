//
//  UITableViewExtension.m
//  GettingStarted
//
//  Created by Moch on 10/29/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import "UITableViewExtension.h"

@implementation UITableViewExtension

@end


#pragma mark - 快速创建表视图

@implementation UITableView (VGenerate)

+ (instancetype)v_tableViewWithFrame:(CGRect)frame
							   style:(UITableViewStyle)style
						   dataSouce:(id <UITableViewDataSource>)dataSource
							delegate:(id <UITableViewDelegate>) delegate {
    UITableView *tableView = [[self alloc] initWithFrame:frame style:style];
    tableView.dataSource = dataSource;
    tableView.delegate = delegate;
    tableView.layer.masksToBounds = YES;
    tableView.tableFooterView = [UIView new];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorInset = UIEdgeInsetsZero;
    if ([tableView respondsToSelector:@selector(layoutMargins)]) {
        tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    return tableView;
}

+ (instancetype)v_tableViewWithSize:(CGSize)size
							 center:(CGPoint)center
							  style:(UITableViewStyle)style
						  dataSouce:(id <UITableViewDataSource>)dataSource
						   delegate:(id <UITableViewDelegate>) delegate {
    CGRect frame = CGRectMake(center.x - size.width / 2,
                              center.y - size.height / 2,
                              size.width,
                              size.height);
    return [self v_tableViewWithFrame:frame style:style dataSouce:dataSource delegate:delegate];
}

@end