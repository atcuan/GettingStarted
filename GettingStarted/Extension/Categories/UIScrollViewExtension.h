//
//  UIScrollViewExtension.h
//  GettingStarted
//
//  Created by Moch on 10/29/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIScrollViewExtension : NSObject

@end

#pragma mark - 滚动视图框架访问器方法

@interface UIScrollView (VAccessor)

/**
 *  设置滚动视图的顶部内容缩进
 *
 *  @param contentInsetTop 顶部内容缩进
 */
- (void)v_setContentInsetTop:(CGFloat)contentInsetTop;

/**
 *  获取滚动视图的顶部内容缩进
 *
 *  @return 顶部内容缩进
 */
- (CGFloat)v_contentInsetTop;

/**
 *  设置滚动视图的底部内容缩进
 *
 *  @param contentInsetBottom 底部内容缩进
 */
- (void)v_setContentInsetBottom:(CGFloat)contentInsetBottom;

/**
 *  获取滚动视图的底部内容缩进
 *
 *  @return 底部内容缩进
 */
- (CGFloat)v_contentInsetBottom;

/**
 *  设置滚动视图左侧内容缩进
 *
 *  @param contentInsetLeft 左侧内容缩进
 */
- (void)v_setContentInsetLeft:(CGFloat)contentInsetLeft;

/**
 *  获取滚动视图左侧内容缩进
 *
 *  @return 滚动视图左侧内容缩进
 */
- (CGFloat)v_contentInsetLeft;

/**
 *  设置滚动视图右侧内容缩进
 *
 *  @param contentInsetRight 滚动视图右侧内容缩进
 */
- (void)v_setContentInsetRight:(CGFloat)contentInsetRight;

/**
 *  获取滚动视图右侧内容缩进
 *
 *  @return 滚动视图右侧内容缩进
 */
- (CGFloat)v_contentInsetRight;

/**
 *  设置滚动视图内容横向超出位置
 *
 *  @param contentOffsetX 横向超出位置
 */
- (void)v_setContentOffsetX:(CGFloat)contentOffsetX;

/**
 *  获取滚动视图内容横向超出位置
 *
 *  @return 横向超出位置
 */
- (CGFloat)v_contentOffsetX;

/**
 *  设置滚动视图内容纵向超出位置
 *
 *  @param contentOffsetY 纵向超出位置
 */
- (void)v_setContentOffsetY:(CGFloat)contentOffsetY;

/**
 *  获取滚动视图内容纵向超出位置
 *
 *  @return 纵向超出位置
 */
- (CGFloat)v_contentOffsetY;

/**
 *  设置滚动视图内容宽度
 *
 *  @param contentSizeWidth 内容宽度
 */
- (void)v_setContentSizeWidth:(CGFloat)contentSizeWidth;

/**
 *  获取滚动视图内容宽度
 *
 *  @return 内容宽度
 */
- (CGFloat)v_contentSizeWidth;

/**
 *  设置滚动视图内容高度
 *
 *  @param contentSizeHeight 内容高度
 */
- (void)v_setContentSizeHeight:(CGFloat)contentSizeHeight;

/**
 *  获取滚动视图内容高度
 *
 *  @return 滚动视图内容高度
 */
- (CGFloat)v_contentSizeHeight;
@end

