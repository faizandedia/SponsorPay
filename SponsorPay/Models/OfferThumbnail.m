//
//  OfferThumbnail.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "OfferThumbnail.h"

@implementation OfferThumbnail

@synthesize offerID;
@synthesize lowerRes;
@synthesize higherRes;


- (void) dealloc {
    self.lowerRes = nil;
    self.higherRes = nil;
}

@end
