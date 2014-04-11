//
//  OfferViewController.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {

    NSArray *offers;
}

@property (nonatomic,strong) NSArray *offers;

@end
