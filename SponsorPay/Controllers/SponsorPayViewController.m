//
//  SponsorPayViewController.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "SponsorPayViewController.h"
#import "OffersRequest.h"
#import "OfferViewController.h"
#import "Common.h"


@interface SponsorPayViewController ()

@end

@implementation SponsorPayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"SponsorPay";
    
}

- (void) showMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

#pragma mark -
#pragma mark Request Delegates

- (void)requestRecieved:(BaseRequest *)request withResponse:(id)response {
    
    [Common hideLoader];
    NSArray *list = response;
    if (list && list.count == 0) {
        [self showMessage:@"No offers"];
        return;
    }
    OfferViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"OfferViewController"];
    controller.offers = response;
    [self.navigationController pushViewController:controller animated:YES];

}


- (void)requestFailed:(BaseRequest *)request withResponse:(id)response {

    [Common hideLoader];
    NSError *error = response;
    NSDictionary *dic = error.userInfo;
    NSString *message = [dic objectForKey:@"NSLocalizedRecoverySuggestion"];
    if (!message) {
        message = error.domain;
    }
    [self showMessage:message];
}


#pragma mark -
#pragma mark Actions

-(IBAction)actionSubmit:(id)sender {
    
    if (![Common isConnected]) {
        [self showMessage:@"No Internet Connection"];
        return;
    }
    
    OffersRequest *request = [[OffersRequest alloc]init];
    request.appID = textFieldAppID.text;
    request.apiKey = textFieldAPIKey.text;
    request.uID = textFieldUID.text;
    request.pub0 = textFieldPub0.text;
    [textFieldPub0 resignFirstResponder];
    [textFieldAPIKey resignFirstResponder];
    [textFieldUID resignFirstResponder];
    [textFieldAppID resignFirstResponder];
    [request makeRequest:self  finishSel:@selector(requestRecieved:withResponse:)  failSel:@selector(requestFailed:withResponse:)];
    [Common showLoader];
}

@end
