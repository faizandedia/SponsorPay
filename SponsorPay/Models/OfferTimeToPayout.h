//
//  OfferTimeToPayout.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferTimeToPayout : NSObject {

    int offerID;
    NSString *amount;
    NSString *readable;
    
}

@property (nonatomic,assign) int offerID;
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSString *readable;

@end
