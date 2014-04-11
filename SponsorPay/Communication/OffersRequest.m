//
//  OffersRequest.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "OffersRequest.h"
#import "NSString+SHA1.h"
#import "Offer.h"
#import "OfferThumbnail.h"
#import "OfferTimeToPayout.h"
#import "OfferType.h"
#import <AdSupport/AdSupport.h>


#define kLocale @"DE"


@implementation OffersRequest
@synthesize appID;
@synthesize apiKey;
@synthesize uID;
@synthesize pub0;


- (id)init {
    self = [super init];
    if (self) {
        self.requestName = SPONSOR_PAY_OFFERS;
        self.appID = @"2070";
        self.apiKey = @"1c915e3b5d42d05136185030892fbb846c278927";
        self.uID = @"spiderman";
        self.pub0 = @"";
    }
    return self;
}

/* Making Offers Request*/


- (void) makeRequest:(id)_delegate finishSel:(SEL)_didFinish failSel:(SEL)_didFail {
    
    
    /*Setting up Parameters */
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:appID forKey:@"appid"];
    [dic setObject:kIP forKey:@"ip"];
    [dic setObject:kLocale forKey:@"locale"];
    int timestamp = [[NSDate date] timeIntervalSince1970];
    [dic setObject:[NSString stringWithFormat:@"%d",timestamp] forKey:@"timestamp"];
    [dic setObject:uID forKey:@"uid"];
    if (self.pub0) {
        [dic setObject:pub0 forKey:@"pub0"];
    }
    
    [dic setObject:@"json" forKey:@"format"];
    [dic setObject:@"112" forKey:@"offer_types"];
    NSString *deviceID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    [dic setObject:deviceID forKey:@"device_id"];
    
    
    /*Generating Hash  key */
    NSArray *keys = [dic allKeys];
    keys = [keys sortedArrayUsingDescriptors:@[ [NSSortDescriptor  sortDescriptorWithKey:@"" ascending:YES selector:@selector(localizedStandardCompare:)]]];
    NSMutableString *paramsString = [NSMutableString string];
    for ( int i=0; i<keys.count; i++)
    {
        NSString* key = [keys objectAtIndex:i];
        NSString* value = [dic objectForKey:key];
        [paramsString appendFormat:@"%@=%@",key,value];
        [paramsString appendString:@"&"];
        
    }
    
    NSString *hashKey = [NSString stringWithFormat:@"%@%@",paramsString,apiKey];
    NSString *sha1 = [hashKey sha1];
    
    [dic setObject:sha1 forKey:@"hashkey"];
    [paramsString appendString:[NSString stringWithFormat:@"hashkey=%@",sha1]];
    

    /*Sending Request */
    self.params = paramsString;
    self.requestParams = dic;
    [super makeRequest:_delegate finishSel:_didFinish failSel:_didFail];
}

/* Response Validation for Offers */

- (void) requestFinished:(HTTPRequest *)request response:(id)response {
    NSString* responseString = [[NSString alloc] initWithBytes:[response bytes] length:[response length] encoding:NSUTF8StringEncoding];
    if (responseString) {
        NSString *signature = [request.responseHeaders valueForKey:@"X-Sponsorpay-Response-Signature"];
        NSString *hashKey = [NSString stringWithFormat:@"%@%@",responseString,apiKey];
        NSString *sha1 = [hashKey sha1];
        if ([signature isEqualToString:sha1]) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
           [super requestFinished:request response:json];
        }
        else {
            [super requestFailed:request error:[NSError errorWithDomain:@"Invalid Response" code:-1 userInfo:nil]];
        }
        
    }
    
}


/* Parsing Offers */

- (void) didReceiveResponse:(id)response parsedResult:(id)object {
    
    NSArray *offers = [response objectForKey:@"offers"];
    NSMutableArray *offersList = [NSMutableArray array];
    for (int i=0; i<offers.count; i++) {
        NSDictionary *offerDic = [offers objectAtIndex:i];
        Offer *offer = [[Offer alloc]init];
        int offerID = [[offerDic objectForKey:@"offer_id"] intValue];
        offer.offerID = offerID;
        offer.title = [offerDic objectForKey:@"title"];
        offer.payOut = [[offerDic objectForKey:@"payout"]intValue];
        offer.teaser = [offerDic objectForKey:@"teaser"];
        offer.requiredActions = [offerDic objectForKey:@"required_actions"];
        offer.storeID = [offerDic objectForKey:@"store_id"];
        offer.link = [offerDic objectForKey:@"link"];
        

        NSDictionary *thumbnails = [offerDic objectForKey:@"thumbnail"];
        
        OfferThumbnail *offerThumbnail = [[OfferThumbnail alloc]init];
        offerThumbnail.offerID = offerID;
        offerThumbnail.lowerRes = [thumbnails objectForKey:@"lowres"];
        offerThumbnail.higherRes = [thumbnails objectForKey:@"hires"];
        
        offer.thumbnails = offerThumbnail;
        
        NSDictionary *timeToPayout = [offerDic objectForKey:@"time_to_payout"];
        OfferTimeToPayout *offerTimeToPayout = [[OfferTimeToPayout alloc]init];
        offerTimeToPayout.offerID = offerID;
        offerTimeToPayout.amount = [timeToPayout objectForKey:@"amount"];
        offerTimeToPayout.readable = [timeToPayout objectForKey:@"readable"];
        
        offer.timeToPayout = offerTimeToPayout;
        
        NSMutableArray *offerTypes = [NSMutableArray array];
        NSArray *types = [offerDic objectForKey:@"offer_types"];
        for (NSDictionary *type in types) {
            OfferType *offerType = [[OfferType alloc]init];
            offerType.offerID = offerID;
            offerType.offerTypeID = [[type objectForKey:@"offer_type_id"] intValue];
            offerType.readable = [type objectForKey:@"readable"];
            [offerTypes addObject:offerType];
        }
        
        offer.offerTypes = offerTypes;
        [offersList addObject:offer];
        
    }
    
    [super didReceiveResponse:response parsedResult:offersList];
    
}


@end
