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

@interface Product : NSObject

@property (strong,nonatomic) NSString *productId;
@property (strong,nonatomic) NSString *categoryId;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *baseUnitPrice;
@property (nonatomic) int quantity;
@property (strong,nonatomic) NSArray *attributes;

-(id) initWithDetails:(NSString *)productId categoryId:(NSString *)categoryId name:(NSString *)name baseUnitPrice:(NSString *)baseUnitPrice quantity:(int)quantity attributes:(NSArray *)attributes;

-(float) totalPrice;
@end
