//
//  BaseRequest.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"


@protocol BaseRequestDelegate <NSObject>
@end

@interface BaseRequest : NSObject  {
    
    SEL didFinish;
    SEL didFail;
    __weak id<BaseRequestDelegate> delegate;
    HTTPRequest *httRequest;
    NSString *requestName;
    NSDictionary *requestParams;
    NSDictionary *userInfo;
    BOOL responseSuccess;
    NSString *responseMessage;
    NSString *responseStatusCode;
    NSString *params;
    
    
}

@property (nonatomic,assign) SEL didFinish;
@property (nonatomic,assign) SEL didFail;
@property (nonatomic,weak) id<BaseRequestDelegate> delegate;
@property (nonatomic,strong) NSString *requestName;
@property (nonatomic,strong) NSDictionary *requestParams;
@property (nonatomic,strong) NSDictionary *userInfo;
@property (nonatomic,readonly) BOOL responseSuccess;
@property (nonatomic,strong,readonly) NSString *responseMessage;
@property (nonatomic,strong,readonly) NSString *responseStatusCode;
@property (nonatomic,retain) NSString *params;

- (void) cancelRequest;
- (void) makeRequest:(id)delegate finishSel:(SEL)didFinish failSel:(SEL)didFail;
- (void) didReceiveResponse:(id)response parsedResult:(id)object;
- (void) didReceiveFailed:(NSError*)error;
- (void) requestFinished:(HTTPRequest *)request response:(id)response;
- (void) requestFailed:(HTTPRequest *)request error:(NSError*)error;


@end
