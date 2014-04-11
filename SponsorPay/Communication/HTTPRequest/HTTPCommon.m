//
//  HttpCommon.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "HTTPCommon.h"
#import "Enum.h"
#import "Url.h"

@implementation HTTPCommon


static SERVER_MODE mode = PRODUCTION;


+ (NSString*) getBaseUrl {
    NSString *baseUrl = nil;
    switch (mode) {
        case DEVELOPMENT:
            baseUrl = BASE_URL_DEVELOPMENT;
            break;
        case STAGING:
            baseUrl = BASE_URL_STAGING;
            break;
        case PRODUCTION:
            baseUrl = BASE_URL_PRODUCTION;
            break;
        default:
            baseUrl = BASE_URL_PRODUCTION;
            break;
    }
    return baseUrl;
}


@end
