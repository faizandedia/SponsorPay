//
//  Common.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Common : NSObject

+ (BOOL) isConnected; // Checking of Internet Connectivity
+ (void) showLoader;
+ (void) hideLoader;

@end
