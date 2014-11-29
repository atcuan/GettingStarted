//
//  UIViewControllerExtension.h
//  GettingStarted
//
//  Created by Moch on 11/2/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewControllerExtension : NSObject

@end

@interface UIViewController (VNavigationActivityIndicatorView)

/**
 *  添加导航栏中间部位进度指示器
 */
- (void)v_addNavigationBarActivityIndicatorAnimation;

/**
 *  移除导航栏中间部位进度指示器
 */
- (void)v_removeNavigationBarActivityIndicatorAnimation;


/**
 *  添加导航栏右边部位进度指示器
 */
- (void)v_addNavigationBarRightItemActivityIndicatorAnimation;

/**
 *  移除导航栏右边部位进度指示器
 */
- (void)v_removeNavigationBarRightItemActivityIndicatorAnimation;

/**
 *  是否正在动画中
 */
- (BOOL)v_isNavigationActivityIndicatorViewInAnimation;

@end
