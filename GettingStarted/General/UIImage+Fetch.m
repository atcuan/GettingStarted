//
//  UIImage+Fetch.m
//  GettingStarted
//
//  Created by Moch on 14-4-18.
//  Copyright (c) 2014年 Moch. All rights reserved.
//

#import "UIImage+Fetch.h"

@implementation UIImage (Fetch)

+ (UIImage *)imageWithName:(NSString *)aName {
    return [self imageWithName:aName suffix:@"png"];
}

+ (UIImage *)imageWithName:(NSString *)aName suffix:(NSString *)aSuffix {
    return [UIImage imageWithContentsOfFile:
            [[NSBundle mainBundle]
             pathForResource:aName
             ofType:aSuffix]];
}

+ (UIImage *)imageWithNameHasSuffix:(NSString *)aNameHasSuffix {
    return [UIImage imageWithContentsOfFile:
            [[NSBundle mainBundle]
             pathForAuxiliaryExecutable:aNameHasSuffix]];
}

@end