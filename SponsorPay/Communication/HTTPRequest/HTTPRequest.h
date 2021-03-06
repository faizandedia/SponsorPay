//
//  HTTPRequest.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"
#import "Url.h"

@class HTTPRequest;

@protocol HTTPRequestDelegate <NSObject>

@optional
- (void)requestStarted:(HTTPRequest *)request;
- (void)request:(HTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders;
- (void)request:(HTTPRequest *)request willRedirectToURL:(NSURL *)newURL;
- (void)requestFinished:(HTTPRequest *)request;
- (void)requestFailed:(HTTPRequest *)request;
- (void)requestRedirected:(HTTPRequest *)request;
// When a delegate implements this method, it is expected to process all incoming data itself
// This means that responseData / responseString / downloadDestinationPath etc are ignored
// You can have the request call a different method by setting didReceiveDataSelector
- (void)request:(HTTPRequest *)request didReceiveData:(NSData *)data;

@end


@interface HTTPRequest : NSObject {
    __weak HTTPClient *client;
    NSDictionary *responseDictonary;
    NSString *requestName;
    NSDictionary *responseHeaders;
    id responseObject;
    __strong id<HTTPRequestDelegate> requestDelegate;
    SEL didFinish;
    SEL didFail;
    
    
}

@property (nonatomic,weak) HTTPClient *client;
@property (nonatomic,strong) NSString *requestName;
@property (nonatomic,assign) SEL didFinish;
@property (nonatomic,assign) SEL didFail;
@property (nonatomic,strong) NSDictionary *responseHeaders;
@property (nonatomic,strong) id<HTTPRequestDelegate> requestDelegate;

+ (id) requestWithURL:(NSString *)path requestDictonary:(NSDictionary*)dic delegate:(id)delegate didFinished:(SEL)finish didFailed:(SEL)failed userInfo:(NSDictionary*)userInfo;

- (NSString*) getReqName;
- (void)clearDelegatesAndCancel;

@end
