//
//  SponsorPayViewController.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/9/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorPayViewController : UIViewController {
    IBOutlet UITextField *textFieldUID;
    IBOutlet UITextField *textFieldAPIKey;
    IBOutlet UITextField *textFieldAppID;
    IBOutlet UITextField *textFieldPub0;
}


-(IBAction)actionSubmit:(id)sender;
@end
