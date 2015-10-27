//
//  HomeGoodsModel.h
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeGoodsModel : NSObject
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,assign) NSUInteger level;
@property (nonatomic,copy) NSString *addTime;
@property (nonatomic,copy) NSString *headIcon;
@property (nonatomic,copy) NSString *realPrice;
@property (nonatomic,copy) NSString *orignPrice;
@property (nonatomic,copy) NSArray *pics;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *location;
@end
