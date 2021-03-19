/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/
#import "Product.h"

@implementation Product

@synthesize productId;
@synthesize categoryId;
@synthesize name;
@synthesize baseUnitPrice;
@synthesize quantity;
@synthesize attributes;


-(id) initWithDetails:(NSString *)productIdParam categoryId:(NSString *)categoryIdParam name:(NSString *)nameParam baseUnitPrice:(NSString *)baseUnitPriceParam quantity:(int)quantityParam attributes:(NSArray *)attributesParam;
{
    self = [super init];
    if(self)
    {
        self.productId = productIdParam;
        self.categoryId = categoryIdParam;
        self.name = nameParam;
        self.baseUnitPrice = baseUnitPriceParam;
        self.quantity = quantityParam;
        self.attributes = attributesParam;
    }
    return self;
}

-(float) totalPrice
{
    float totalPrice = 0.00F;
    
    if(self.quantity > 0)
    {
        float unitPrice = [self.baseUnitPrice floatValue];
        totalPrice = self.quantity * unitPrice;
    }
    
    return totalPrice;
}

//Used to establish uniqueness in a NSSet data structure
-(BOOL) isEqual:(id)object
{
    if([object isKindOfClass:[Product class]])
    {
        Product * incoming = (Product *)object;
        if([self.productId isEqualToString:incoming.productId])
        {
            return YES;
        }
    }
    return NO;
}


-(NSUInteger) hash
{
    return [self.productId hash];
}
@end
