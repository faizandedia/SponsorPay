//
//  OfferType.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "OfferType.h"

@implementation OfferType
@synthesize offerID;
@synthesize offerTypeID;
@synthesize readable;


- (void) dealloc {
    self.readable = nil;
}

@end
