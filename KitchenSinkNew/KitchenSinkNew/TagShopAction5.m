/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/

#import "TagShopAction5.h"
@import DAMod;

@interface TagShopAction5()

@property (nonatomic,strong) NSString *pageName;
@property (nonatomic,strong) Product *product;

@end

@implementation TagShopAction5

@synthesize pageName;
@synthesize product;

-(id) initTag:(NSString *) pageNameParam product:(Product *) productParam
{
    self = [super init];
    if(self)
    {
        self.pageName = pageNameParam;
        self.product = productParam;
    }
    
    return self;
}

-(void) executeTag
{
    // Perform Tagging
    NSString *productId = self.product.productId;
    NSString *productName = self.product.name;
    NSString *categoryId = self.product.categoryId;
    NSString *currency = @"USD"; //hard coded for sake of simplicity
    NSString *baseUnitPrice = self.product.baseUnitPrice;
    NSString *quantity = [NSString stringWithFormat:@"%d",self.product.quantity];
    NSArray *attributes = self.product.attributes;
    
    BOOL success = [DigitalAnalytics fireShopAction5:productId productName:productName quantity:quantity baseUnitPrice:baseUnitPrice category:categoryId currencyCode:currency attributes:attributes];
    
    [self finish:success];
}

@end
