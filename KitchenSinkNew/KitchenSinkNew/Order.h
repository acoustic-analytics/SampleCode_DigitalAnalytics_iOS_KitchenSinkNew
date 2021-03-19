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

@interface Order : NSObject

@property (nonatomic,strong) NSString *orderId;
@property (nonatomic,strong) NSString *subTotal;
@property (nonatomic,strong) NSString *customerId;
@property (nonatomic,strong) NSString *customerCity;
@property (nonatomic,strong) NSString *customerState;
@property (nonatomic,strong) NSString *customerZip;
@property (nonatomic,strong) NSString *shippingCharge;
@property (nonatomic,strong) NSString *currencyCode;
@property (nonatomic,strong) NSArray  *attributes;


@end
