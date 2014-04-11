//
//  Common.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "Common.h"
#import "SponsorPayAppDelegate.h"
#import "Reachability.h"

@implementation Common

static UIView *activityView;
static UIActivityIndicatorView*activityIndicator;
static bool isShowing;


+ (BOOL) isConnected {
    if ([Reachability isConnected]) {
        return true;
    }
    return false;
}


+ (void) showLoader {
    if (isShowing) {
        return;
    }
    isShowing = YES;
    SponsorPayAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    activityView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    activityView.backgroundColor = [UIColor blackColor];
    activityView.userInteractionEnabled = YES;
    activityView.alpha = 0.3;
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = activityView.center;
    [activityIndicator hidesWhenStopped];
    [activityIndicator startAnimating];
    [delegate.window addSubview:activityIndicator];
    
    [delegate.window addSubview:activityView];
}

+ (void) hideLoader {
    if (!isShowing) {
        return;
    }
    [activityIndicator stopAnimating];
    [activityIndicator removeFromSuperview];
    [activityView removeFromSuperview];
    isShowing = NO;
}


@end
