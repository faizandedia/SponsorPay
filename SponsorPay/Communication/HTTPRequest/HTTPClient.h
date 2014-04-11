//
//  HttpClient.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "AFHTTPClient.h"

@interface HTTPClient : AFHTTPClient {
    BOOL networkConnected;
}

@property (nonatomic,assign) BOOL networkConnected;

+ (id)sharedHTTPClient;

@end
