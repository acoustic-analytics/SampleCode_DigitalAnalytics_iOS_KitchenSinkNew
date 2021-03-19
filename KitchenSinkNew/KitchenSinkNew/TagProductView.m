/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/

#import "TagProductView.h"
#import "Product.h"
@import DAMod;

@interface TagProductView()

@property (nonatomic,strong) NSString *pageName;
@property (nonatomic,strong) NSArray *products;

@end

@implementation TagProductView

@synthesize pageName;
@synthesize products;

-(id) initTag:(NSString *) pageNameParam products:(NSArray *) productsParam
{
    self = [super init];
    
    if(self)
    {
        self.pageName = pageNameParam;
        self.products = productsParam;
    }
    
    return self;
}

-(void) executeTag
{
    BOOL success = YES;
    
    for(Product *product in products)
    {
        NSString *productId = product.productId;
        NSString *productName = product.name;
        NSString *categoryId = product.categoryId;
        NSArray *attributes = product.attributes;
        
        if(![DigitalAnalytics fireProductview:self.pageName productId:productId productName:productName category:categoryId attributes:attributes])
        {
            success = NO;
        }
    }
    
    [self finish:success];
}

@end
