/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/
#import <UIKit/UIKit.h>

@interface CheckoutDataViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *customerId;
@property (nonatomic,weak) IBOutlet UITextField *customerCity;
@property (nonatomic,weak) IBOutlet UITextField *customerState;
@property (nonatomic,weak) IBOutlet UITextField *customerZip;


-(IBAction)collectData:(id)sender;
-(IBAction)cancel:(id)sender;

@end
