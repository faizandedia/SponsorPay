
//  OfferViewController.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "OfferViewController.h"
#import "OfferCell.h"
#import "Offer.h"
#import "OfferThumbnail.h"
#import "UIImageView+AFNetworking.h"

@interface OfferViewController ()

@end

@implementation OfferViewController
@synthesize offers;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Offers";
    
}

#pragma mark -
#pragma mark TableView DataSource And Delegates


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return [offers count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"OfferCell";
    OfferCell *cell = (OfferCell*)[_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [OfferCell createCell];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    Offer *offer = [offers objectAtIndex:indexPath.row];
    cell.labelTitle.text = offer.title;
    cell.labelPayout.text = [NSString stringWithFormat:@"Payout = %d",offer.payOut];
    cell.labelTeaser.text = offer.teaser;
    
    OfferThumbnail *thubmnail = offer.thumbnails;
    if (thubmnail) {
        [cell.imageViewThumb setImageWithURL:[NSURL URLWithString:thubmnail.higherRes] cache:YES];
    }
    else {
        [cell.imageViewThumb setImage:nil];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
}



@end
