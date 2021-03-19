/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/

#import "BaseTag.h"
#import <UIKit/UIKit.h>

@implementation BaseTag

-(void) finish:(BOOL)success
{
    NSString *tagClass = NSStringFromClass([self class]);
    NSString *message = nil;
    if(success)
    {
        message = [NSString stringWithFormat:@"%@ Success",tagClass];
    }
    else
    {
        message = [NSString stringWithFormat:@"%@ Failed",tagClass];
    }
    
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"Close", nil];
    [toast show];
    
    /*int duration = 1; // duration in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });*/
}

@end
