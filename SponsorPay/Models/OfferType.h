//
//  OfferType.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferType : NSObject {
    int offerTypeID;
    int offerID;
    NSString *readable;
}

@property (nonatomic,assign) int offerTypeID;
@property (nonatomic,assign) int offerID;
@property (nonatomic,strong) NSString *readable;

@end
