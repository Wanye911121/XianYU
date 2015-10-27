//
//  HomeGoodsFrame.m
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "HomeGoodsFrame.h"
#import "HomeGoodsModel.h"

#define CellPadding 10
#define PicPadding 5
#define PicHeight (SCREEN_WIDTH - CellPadding*2-2*PicPadding)/3

@implementation HomeGoodsFrame

-(void)setGoodModel:(HomeGoodsModel *)goodModel
{
    _goodModel = goodModel;
    
    CGFloat backgroundX = CellPadding;
    CGFloat backgroundY = 0;
    CGFloat backgroundW = SCREEN_WIDTH - 2*backgroundX;
    
    CGFloat headIconX = CellPadding;
    CGFloat headIconY = CellPadding;
    CGFloat headIconWH = 40;
    self.headIconViewF = CGRectMake(headIconX, headIconY, headIconWH, headIconWH);
    
    CGFloat nickNameX = CGRectGetMaxX(self.headIconViewF)+CellPadding;
    CGFloat nickNameY = headIconY;
    CGSize  nickeNameSize = [goodModel.nickName sizeWithTextfont:[UIFont systemFontOfSize:14] maxW:100];
    self.nickNameLabelF = (CGRect){{nickNameX,nickNameY},nickeNameSize};
    
    CGFloat timeX = nickNameX;
    CGFloat timeY = CGRectGetMaxY(self.nickNameLabelF)+CellPadding;
    CGSize  timeSize = [[NSString addtime:goodModel.addTime] sizeWithTextfont:[UIFont systemFontOfSize:12] maxW:200];
    self.addTimeLabelF = (CGRect){{timeX,timeY},timeSize};
    
    
    NSString *priceStr = [NSString stringWithFormat:@"¥%@ %@",goodModel.realPrice,goodModel.orignPrice];
    CGSize priceSize = [priceStr sizeWithTextfont:[UIFont systemFontOfSize:16] maxW:200];
    CGFloat priceX = SCREEN_WIDTH-2*CellPadding+5-priceSize.width;
    CGFloat priceY = nickNameY;
    self.priceLabelF = (CGRect){{priceX,priceY},priceSize};
    
    CGFloat originalH = 0;
    
    if (goodModel.pics.count>0) {
        
        CGFloat photoX = 0;
        CGFloat photoY = CGRectGetMaxY(self.headIconViewF)+CellPadding;
        
        CGSize photoSize;
        
        switch (goodModel.pics.count) {
            case 1:
                photoSize = CGSizeMake(PicHeight*2+PicPadding, PicHeight);
                break;
            case 2:
                photoSize = CGSizeMake(PicHeight*2+PicPadding, PicHeight);
            case 3:
                photoSize = CGSizeMake(SCREEN_WIDTH-CellPadding*2, PicHeight);
            default:
                break;
        }
        
        self.picsViewF = (CGRect){{photoX,photoY},photoSize};
        originalH = CGRectGetMaxY(self.picsViewF) +CellPadding;
    }else{
        originalH = CGRectGetMaxY(self.headIconViewF) +CellPadding;
    }
    
    CGFloat contentX = CellPadding;
    CGFloat contentY = originalH;
    CGSize  contentSize = [goodModel.content sizeWithTextfont:[UIFont systemFontOfSize:14] maxW:backgroundW - 2*CellPadding];
    self.contentF = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    
    CGFloat locateX = CellPadding;
    CGFloat locateY = CGRectGetMaxY(self.contentF)+CellPadding;
    CGFloat locateW = 200;
    CGFloat locateH = 20;
    self.locationBtnF = CGRectMake(locateX, locateY, locateW, locateH);
    
    CGFloat assessW = 19;
    CGFloat assessH = 14;
    CGFloat assessX = backgroundW - CellPadding- assessW;
    CGFloat assessY = locateY;
    self.assessBtnF = CGRectMake(assessX, assessY, assessW, assessH);
    

    CGFloat backgroundH = CGRectGetMaxY(self.locationBtnF)+CellPadding;
    self.backgroundViewF = CGRectMake(backgroundX, backgroundY, backgroundW, backgroundH);
    
    self.cellHeight = CGRectGetMaxY(self.backgroundViewF)+CellPadding;
    
    
}
@end
