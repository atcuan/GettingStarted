//
//  UIScrollView+RefreshControl.h
//  GettingStarted
//
//  Created by Moch on 8/27/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshControl.h"

@interface UIScrollView (RefreshControl)

@property (nonatomic, strong) NSString *topRefreshControlPullToRefreshingText;
@property (nonatomic, strong) NSString *topRefreshControlPullReleaseToRefreshingText;
@property (nonatomic, strong) NSString *topRefreshControlpullRefreshingText;

@property (nonatomic, strong) NSString *bottomRefreshControlPullToRefreshingText;
@property (nonatomic, strong) NSString *bottomRefreshControlPullReleaseToRefreshingText;
@property (nonatomic, strong) NSString *bottomRefreshControlpullRefreshingText;

@property (nonatomic, strong) UIColor *statusTextColor;
@property (nonatomic, strong) UIColor *loadingCircleColor;

- (void)addTopRefreshControlUsingBlock:(void (^)())callback;
- (void)addTopRefreshControlUsingBlock:(void (^)())callback refreshControlPullType:(RefreshControlPullType)refreshControlPullType;
- (void)topRefreshControlStopRefreshing;
- (void)removeTopRefreshControl;

- (void)addBottomRefreshControlUsingBlock:(void (^)())callback;
- (void)addBottomRefreshControlUsingBlock:(void (^)())callback refreshControlPullType:(RefreshControlPullType)refreshControlPullType;
- (void)bottomRefreshControlStopRefreshing;
- (void)removeBottomRefreshControl;

@end
