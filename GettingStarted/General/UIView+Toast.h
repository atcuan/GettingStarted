//
//  UIView+Toast.h
//  GettingStarted
//
//  Created by Moch on 8/19/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBottomVerticalDistanceForEdges 80
#define kTopVerticalDistanceForEdges 65

typedef NS_ENUM(NSInteger, CHToastAppearOrientation) {
    CHToastAppearOrientationTop,
    CHToastAppearOrientationBottom
};

@interface UIView (Toast)

// Toast, disappear automatic, only support portrait orientation
+ (void)toastWithMessage:(NSString *)message;
+ (void)toastWithMessage:(NSString *)message appearOrientation:(CHToastAppearOrientation)orientation;

- (void)makeToast:(NSString *)message;

@end