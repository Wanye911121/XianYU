//
//  HomeGoodsFrame.h
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeGoodsModel;
@interface HomeGoodsFrame : NSObject
@property (nonatomic,strong) HomeGoodsModel *goodModel;

@property (nonatomic,assign) CGRect nickNameLabelF;
@property (nonatomic,assign) CGRect levelLabelF;
@property (nonatomic,assign) CGRect addTimeLabelF;
@property (nonatomic,assign) CGRect headIconViewF;
@property (nonatomic,assign) CGRect picsViewF;
@property (nonatomic,assign) CGRect locationBtnF;
@property (nonatomic,assign) CGRect assessBtnF;
@property (nonatomic,assign) CGRect contentF;
@property (nonatomic,assign) CGRect priceLabelF;

@property (nonatomic,assign) CGRect backgroundViewF;
@property (nonatomic,assign) CGFloat cellHeight;
@end
