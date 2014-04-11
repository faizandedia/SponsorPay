//
//  OffersRequest.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "BaseRequest.h"

#define kIP @"109.235.143.113"

@interface OffersRequest : BaseRequest {
    NSString *appID;
    NSString *uID;
    NSString *apiKey;
    NSString *pub0;

}

@property (nonatomic,strong) NSString *appID;
@property (nonatomic,strong) NSString *uID;
@property (nonatomic,strong) NSString *apiKey;
@property (nonatomic,strong) NSString *pub0;

@end
