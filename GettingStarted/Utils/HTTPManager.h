//
//  NIManager.h
//  GettingStarted
//
//  Created by Moch on 8/16/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

#import <Foundation/Foundation.h>

// record current http request method name, when `BaseViewController` disappear will use this variable
extern NSString *CHHTTPRequestMethodName;

// Attention: HttpRequestSerializerTypeXML's serializer is `Unclear` now
typedef NS_ENUM(NSInteger, HTTPRequestSerializerType) {
    HTTPRequestSerializerTypeNone         = 0,
    HTTPRequestSerializerTypeJSON         = 1,
    HTTPRequestSerializerTypePropertyList = 2,
    HTTPRequestSerializerTypeXML          = HTTPRequestSerializerTypePropertyList,
    HTTPRequestSerializerTypeBase64       = 4,
    HTTPRequestSerializerTypeMd5          = 5,
    HTTPRequestSerializerTypeSha1         = 6,
};

typedef NS_ENUM(NSInteger, HTTPResponseSerializerType) {
    HTTPResponseSerializerTypeJSON         = 0,
    HTTPResponseSerializerTypePropertyList = 1,
    HTTPResponseSerializerTypeXMLParser    = 2,
    HTTPResponseSerializerTypeXMLDocument  = 3,
    HTTPResponseSerializerTypeImage        = 4,
    HTTPResponseSerializerTypeCompound     = 5,
    HTTPResponseSerializerTypeNone         = 6
};

@interface HTTPManager : NSObject

// messages
// setting http request serializer type.
// If you wanna encode your request, please call this message in `AppDelegate`.
// The default setting is `HTTPRequestSerializerTypeNone`
+ (void)setHTTPRequestSerializerType:(HTTPRequestSerializerType)requestSerializerType;
+ (HTTPRequestSerializerType)requestSerializerType;
// setting http response serializer type
// If you wanna decode your response, please call this message in `AppDelegate`.
// The default setting is `HTTPResponseSerializerTypeJSON`
+ (void)setHTTPResponseSerializerType:(HTTPResponseSerializerType)responseSerializerType;

// POST
+ (void)POSTWithMethodName:(NSString *)methodName
                parameters:(NSDictionary *)parameters
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
// POST with data
+ (void)POSTWithMethodName:(NSString *)methodName
                parameters:(NSDictionary *)parameters
                  passData:(NSData *)data
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
// remove request by method name
+ (void)removeRequestByMthodName:(NSString *)methodName;
// remove all request
+ (void)removeAllRequest;

+ (void)requestWillBeginWithProgressAnimation;


@end
