/********************************************************************************************
* Copyright (C) 2016 Acoustic, L.P. All rights reserved.
*
* NOTICE: This file contains material that is confidential and proprietary to
* Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
* industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
* Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
* prohibited.
********************************************************************************************/
#import <Foundation/Foundation.h>

#import "Product.h"
#import "Order.h"

@interface ShoppingCart : NSObject

@property (strong,nonatomic) NSMutableSet *products;

+(ShoppingCart *) instance;

-(void) addToCart:(Product *) product;

-(BOOL) isEmpty;

-(void) clear;

-(float) calculateSubtotal;

-(Order *) generateOrder;

@end
