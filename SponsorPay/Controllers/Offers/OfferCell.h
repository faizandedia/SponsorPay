//
//  OfferCell.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferCell : UITableViewCell {
    
}

@property (nonatomic,assign) IBOutlet UILabel *labelTitle;
@property (nonatomic,assign) IBOutlet UILabel *labelTeaser;
@property (nonatomic,assign) IBOutlet UILabel *labelPayout;
@property (nonatomic,assign) IBOutlet UIImageView *imageViewThumb;

+ (id) createCell;

@end
