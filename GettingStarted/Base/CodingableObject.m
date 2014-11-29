//
//  CodingableObject.m
//  GettingStarted
//
//  Created by Moch on 10/29/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import "CodingableObject.h"
#import "NSObjectExtension.h"

#pragma mark - 可编码的对象
@implementation CodingableObject

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [[self v_properties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [aCoder encodeObject:[self valueForKey:obj] forKey:obj];
    }];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [[self v_properties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self setValue:[aDecoder decodeObjectForKey:obj] forKey:obj];
        }];
    }
    return self;
}


@end
