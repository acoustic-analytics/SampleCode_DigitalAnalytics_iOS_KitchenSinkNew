/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/
#import "TagPageView.h"

#import <UIKit/UIKit.h>
@import DAMod;

@interface TagPageView ()

@property (nonatomic,strong) NSString *pageName;
@property (nonatomic) BOOL sessionStarted;

@end

@implementation TagPageView

@synthesize pageName;
@synthesize sessionStarted;

-(id) initTag:(NSString *) pageNameParam sessionStarted:(BOOL) sessionStartedParam
{
    self = [super init];
    if(self)
    {
        self.pageName = pageNameParam;
        self.sessionStarted = sessionStartedParam;
    }
    return self;
}

-(void) executeTag
{
    if(self.sessionStarted)
    {
        NSLog(@"KitchenSinkNew is Starting New Digital Analytics Session");
        [DigitalAnalytics startNewSession];
    }
    
    BOOL success = [DigitalAnalytics firePageView:self.pageName category:@"iossdk" searchTerm:nil searchResult:nil attributes:nil cmmmc:nil];
    
    [self finish:success];
}
@end
