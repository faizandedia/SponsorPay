//
//  HTTPRequest.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "HTTPRequest.h"
#import "HTTPCommon.h"
#import "HttpClient.h"
#import "AFHTTPRequestOperation.h"



@implementation HTTPRequest
@synthesize client;
@synthesize requestDelegate;
@synthesize didFinish;
@synthesize didFail;
@synthesize responseHeaders;
@synthesize requestName;




+ (id) requestWithURL:(NSString *)path requestDictonary:(NSDictionary*)params delegate:(id)delegate didFinished:(SEL)finish didFailed:(SEL)failed userInfo:(NSDictionary*)userInfo {
    
    
    HTTPRequest * request = [[self alloc]init];
    request.client  = [HTTPClient sharedHTTPClient];
    
    [request.client getPath:path
                 parameters:params
                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        request.responseHeaders = operation.response.allHeaderFields;
                        [request performSelectorOnMainThread:@selector(reportSuccess:) withObject:responseObject waitUntilDone:NO];
                    }
                    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"%@",error.description);
                        [request performSelectorOnMainThread:@selector(reportFail:) withObject:error waitUntilDone:NO];
                        
                    }];
    
    [request setRequestDelegate:delegate];
    [request setDidFail:failed];
    [request setDidFinish:finish];
    [request setRequestName:path];
    return request;
}

- (void)dealloc {
    [self clearDelegatesAndCancel];
    responseObject = nil;
    self.responseHeaders = nil;
    self.requestName = nil;
    
}

#pragma mark -
#pragma mark OverRide Methods


- (void)clearDelegatesAndCancel {
    [client cancelAllHTTPOperationsWithMethod:@"POST" path:requestName];
    [self setRequestDelegate:nil];
    [self setDidFail:nil];
    [self setDidFinish:nil];
}

#pragma mark -
#pragma mark Private Methods

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void) reportFail:(NSError*)error {
    
    if ([requestDelegate respondsToSelector:didFail]) {
        [requestDelegate performSelector:didFail withObject:self withObject:error];
    }
}

- (void) reportSuccess:(id)response {
    if ([requestDelegate respondsToSelector:didFinish]) {
        [requestDelegate performSelector:didFinish withObject:self withObject:response];
    }
}

#pragma clang diagnostic pop

#pragma mark -
#pragma mark Public Methods


- (NSString*) getReqName {
    return requestName;
}

@end
