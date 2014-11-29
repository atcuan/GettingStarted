//
// NSObjectExtension.m
//  GettingStarted
//
//  Created by Moch on 10/29/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import "NSObjectExtension.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation NSObjectExtension

@end

#pragma mark - 对象模型与原生类型间的转换

@implementation NSObject (VConvert)

- (instancetype)v_initWithProperties:(NSDictionary *)properties {
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:properties];
    };
    
    return self;
}

// KVC
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    } else {
        NSLog(@"UndefinedKey: %@", key);
    }
}

// Runtime
- (NSArray *)v_properties {
    NSMutableArray *propertyArray = [[NSMutableArray alloc] init];
    u_int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSString *stringName = [NSString  stringWithCString:propertyName
                                                   encoding:NSUTF8StringEncoding];
        [propertyArray addObject:stringName];
    }
    
    free(propertyList);
    
    return [[NSArray alloc] initWithArray:propertyArray];
}

+ (NSArray *)v_properties {
    NSMutableArray *propertyArray = [[NSMutableArray alloc] init];
    u_int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSString *stringName = [NSString  stringWithCString:propertyName
                                                   encoding:NSUTF8StringEncoding];
        [propertyArray addObject:stringName];
    }
    
    free(propertyList);
    
    return [[NSArray alloc] initWithArray:propertyArray];
}

- (NSDictionary *)v_convertToDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    // 获取本类属性列表字符串数组
    NSMutableArray *propertyArray = [[self v_properties] mutableCopy];
    
    [propertyArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [dict setObject:[self valueForKey:obj] forKey:obj];
    }];
    
    return dict;
}

- (NSString *)v_toString {
    if (![[self v_properties] count]) {
        return nil;
    }
	
	NSMutableDictionary *propertyDictionary = [NSMutableDictionary new];
	NSMutableArray *propertyArray = [[self v_properties] mutableCopy];
	[propertyArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		[propertyDictionary setObject:[self valueForKey:obj] forKey:obj];
	}];
	
	NSString *description = [NSString stringWithFormat:@"<%@: %p, %@>", [self class], self, propertyDictionary];
	
	return description;
}

@end

