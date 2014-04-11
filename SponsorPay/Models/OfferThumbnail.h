//
//  OfferThumbnail.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferThumbnail : NSObject {

    int offerID;
    NSString *lowerRes;
    NSString *higherRes;
}

@property (nonatomic,assign) int offerID;
@property (nonatomic,strong) NSString *lowerRes;
@property (nonatomic,strong) NSString *higherRes;

@end
