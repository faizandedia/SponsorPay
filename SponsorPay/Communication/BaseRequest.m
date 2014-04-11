//
//  BaseRequest.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "BaseRequest.h"
#import "HTTPClient.h"
#import "HTTPRequest.h"
#import "HTTPCommon.h"



#define kResponseCode @"code"
#define kResponseMessage @"message"


@implementation BaseRequest

@synthesize didFinish;
@synthesize didFail;
@synthesize delegate;
@synthesize requestName;
@synthesize requestParams;
@synthesize userInfo;
@synthesize responseSuccess;
@synthesize responseMessage;
@synthesize responseStatusCode;
@synthesize params;

static bool isAlertShowing;

- (id)init {
    self = [super init];
    if (self) {
        self.requestName = nil;
        self.delegate = nil;
        self.didFail  = nil;
        self.didFinish = nil;
        self.requestParams = nil;
        
    }
    return self;
}

- (void) dealloc {
    [self cancelRequest];
    self.requestName = nil;
    self.userInfo = nil;
    responseMessage = nil;
    responseStatusCode = nil;
    httRequest = nil;
    params = nil;
    
}


- (void) cancelRequest {
    if (httRequest) {
        [httRequest clearDelegatesAndCancel];
    }
}

- (void) makeRequest:(id)_delegate finishSel:(SEL)_didFinish failSel:(SEL)_didFail {
    
    if (requestName) {
        self.delegate = _delegate;
        self.didFinish = _didFinish;
        self.didFail = _didFail;
        
        
//        NSMutableDictionary *mDic = [[NSMutableDictionary alloc]initWithDictionary:requestParams];
        NSString *endPointUrl = @"";
        if (params) {
            endPointUrl = [NSString stringWithFormat:@"%@%@",requestName,params];
        }
        else {
            endPointUrl = requestName;
        }
        
        httRequest = [HTTPRequest requestWithURL:endPointUrl requestDictonary:nil delegate:self didFinished:@selector(requestFinished:response:) didFailed:@selector(requestFailed:error:) userInfo:userInfo] ;
        
    }
    else {
        NSLog(@"NO Request Name Defined");
    }
    
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void) requestFinished:(HTTPRequest *)request response:(id)response {

    NSString *code = [response objectForKey:kResponseCode];
    NSString *message = [response objectForKey:kResponseMessage];
    responseStatusCode = code;
    responseMessage =  message;
    if ([code isEqualToString:@"OK"]) {
        [self didReceiveResponse:response parsedResult:nil];
    }
    else  {
        [self didReceiveFailed:[NSError errorWithDomain:message code:-1 userInfo:nil]];
    }
    
}

- (void) requestFailed:(HTTPRequest *)request error:(NSError*)error {
    [self didReceiveFailed:error];
}

- (void) didReceiveResponse:(id)response parsedResult:(id)object {
    
    if ([delegate respondsToSelector:didFinish]) {
        [delegate performSelector:didFinish withObject:self withObject:object ];
    }
}

- (void) didReceiveFailed:(NSError*)error {

    if ([delegate respondsToSelector:didFail]) {
        [delegate performSelector:didFail withObject:self withObject:error];
    }
    
}


@end

