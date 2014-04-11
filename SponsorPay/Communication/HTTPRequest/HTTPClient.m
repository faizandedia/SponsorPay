//
//  HttpClient.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "HTTPClient.h"
#import "HTTPCommon.h"
#import "AFJSONRequestOperation.h"

@implementation HTTPClient
@synthesize networkConnected;

+ (id)sharedHTTPClient
{
    static dispatch_once_t pred = 0;
    static id __httpClient = nil;
    dispatch_once(&pred, ^{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@" ,[HTTPCommon getBaseUrl]]];
        __httpClient = [[self alloc] initWithBaseURL:url];
    });
    return __httpClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    //[self setParameterEncoding:AFJSONParameterEncoding];
    //[self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    
    return self;
}



@end
