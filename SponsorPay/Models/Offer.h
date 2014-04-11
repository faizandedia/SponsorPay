//
//  Offer.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OfferThumbnail;
@class OfferTimeToPayout;

@interface Offer : NSObject {
    int offerID;
    int payOut;
    NSString *requiredActions;
    NSString *storeID;
    NSString *treaser;
    NSString *title;
    NSString *link;
    NSArray *offerTypes;
    OfferThumbnail *thumbnails;
    OfferTimeToPayout *timeToPayout;
}

@property (nonatomic,assign) int offerID;
@property (nonatomic,assign) int payOut;
@property (nonatomic,strong) NSString *requiredActions;
@property (nonatomic,strong) NSString *storeID;
@property (nonatomic,strong) NSString *teaser;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,strong) NSArray *offerTypes;
@property (nonatomic,strong) OfferThumbnail *thumbnails;
@property (nonatomic,strong) OfferTimeToPayout *timeToPayout;

@end
