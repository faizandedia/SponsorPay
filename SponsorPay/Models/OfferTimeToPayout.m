//
//  OfferTimeToPayout.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "OfferTimeToPayout.h"

@implementation OfferTimeToPayout
@synthesize offerID;
@synthesize amount;
@synthesize readable;

- (void) dealloc {
    self.amount = nil;
    self.readable = nil;
}

@end
