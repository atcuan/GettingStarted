//
//  ResizableTextView.m
//  GettingStarted
//
//  Created by Moch Xiao on 10/24/14.
//  Copyright (c) 2014 Foobar. All rights reserved.
//

#import "CHXFlexibleTextView.h"

#pragma mark - 可自动向下扩展的输入框

@interface CHXFlexibleTextView ()
@property (strong, nonatomic) NSLayoutConstraint *heightConstraint;
@end

@implementation CHXFlexibleTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self __initial];
    }
    return self;
}

- (void)awakeFromNib {
    [self __initial];
}

- (void)__initial {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            self.heightConstraint = constraint;
            break;
        }
    }
    if (!self.heightConstraint) {
        
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    BOOL autoLayoutEnabled = self.heightConstraint ? YES : NO;
    [self __handleLayoutUsingAutoLayout:autoLayoutEnabled];
    
    if ([self __initialContentSizeHeight] <= self.bounds.size.height) {
        CGFloat topCorrect = (self.bounds.size.height - self.contentSize.height * [self zoomScale]) / 2.0f;
        topCorrect = (topCorrect < .0f ? .0f : topCorrect);
        self.contentOffset = CGPointMake(0, -topCorrect);
    }
}

- (CGFloat)__initialContentSizeHeight {
    CGSize initialContentSize = self.contentSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        initialContentSize.width += (self.textContainerInset.left + self.textContainerInset.right) / 2.0f;
        initialContentSize.height += (self.textContainerInset.top + self.textContainerInset.bottom) / 2.0f;
    }
    
    return initialContentSize.height;
}

- (void)__handleLayoutUsingAutoLayout:(BOOL)autoLayoutsEnabled {
    CGFloat currentHeight = self.contentSize.height;
    if (self.minimumHeight) {
        currentHeight = MAX(self.minimumHeight, currentHeight);
    }
    if (self.maximumHeight) {
        currentHeight = MIN(self.maximumHeight, currentHeight);
    }
    
    if (autoLayoutsEnabled) {
        self.heightConstraint.constant = currentHeight;
    } else {
        CGRect selfFrame = self.frame;
        selfFrame.size.height = currentHeight;
        self.frame = selfFrame;
    }
    
    self.contentOffset = CGPointMake(0, self.contentSize.height - currentHeight);
    if (_didUpdateTextViewHeight) {
        _didUpdateTextViewHeight(self);
    }
}

@end
