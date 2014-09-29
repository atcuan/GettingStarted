//
//  UIView+FindUIViewController.m
//  LighterReader
//
//  Created by Moch on 14-3-27.
//  Copyright (c) 2014年 Moch. All rights reserved.
//

#import "UIView+FindUIViewController.h"

@implementation UIView (FindUIViewController)

- (UIViewController *)viewController {
    /// Finds the view's view controller.
    
    // Traverse responder chain. Return first found view controller, which will be the view's view controller.
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    // If the view controller isn't found, return nil.
    return nil;
}

@end
