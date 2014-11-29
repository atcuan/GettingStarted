//
//  TextEditConfigure.h
//  GettingStarted
//
//  Created by Moch on 10/24/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VTextEditConfigure : NSObject

@property (nonatomic, weak) UILabel *countingLabel;
@property (nonatomic, assign) NSUInteger maximumLength;
// only text view use
@property (nonatomic, weak) UILabel *placeHolderLabel;

@end

@interface UITextView (TextConfigure)

/**
 *  设置文本编辑监控
 *
 *  @param textConfigure 编辑监控代理
 */
- (void)v_setTextConfigure:(VTextEditConfigure *)textConfigure;

/**
 *  获取文本编辑监控代理
 *
 *  @return 文本编辑监控代理
 */
- (VTextEditConfigure *)v_textConfigure;

@end

@interface UITextField (TextConfigure)

/**
 *  设置文本编辑监控
 *
 *  @param textConfigure 编辑监控代理
 */
- (void)v_setTextConfigure:(VTextEditConfigure *)textConfigure;

/**
 *  获取文本编辑监控代理
 *
 *  @return 文本编辑监控代理
 */
- (VTextEditConfigure *)v_textConfigure;

@end
