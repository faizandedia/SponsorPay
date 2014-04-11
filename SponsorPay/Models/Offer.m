//
//  Offer.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "Offer.h"

@implementation Offer
@synthesize offerID;
@synthesize link;
@synthesize payOut;
@synthesize requiredActions;
@synthesize storeID;
@synthesize teaser;
@synthesize title;
@synthesize offerTypes;
@synthesize thumbnails;
@synthesize timeToPayout;



- (void) dealloc {
    self.link = nil;
    self.requiredActions = nil;
    self.storeID = nil;
    self.teaser = nil;
    self.title = nil;
    self.offerTypes = nil;
    self.thumbnails = nil;
    self.timeToPayout = nil;
}

@end
