//
//  HomePriceView.m
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "HomePriceView.h"

@interface HomePriceView()
@property (nonatomic,weak) UILabel *priceLabel;
@end

@implementation HomePriceView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.image = [UIImage imageNamed:@"meta_cell_price_bg"];
        
        [self createLabel];
    }
    return self;
}

-(void)addOriginStr:(NSString *)originStr realStr:(NSString *)realStr
{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%@ ¥%@",realStr,originStr]];
    
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    textAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
   NSRange range = NSMakeRange(0,realStr.length+1);
    
    [str setAttributes:textAttrs range:range];
    
    NSMutableDictionary *textAttrs2 = [NSMutableDictionary dictionary];
    textAttrs2[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    textAttrs2[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs2[NSStrikethroughStyleAttributeName] = [NSNumber numberWithInteger:NSUnderlinePatternSolid | NSUnderlineStyleSingle];
    NSRange range1 = NSMakeRange(realStr.length+2,originStr.length+1);
    [str setAttributes:textAttrs2 range:range1];
    
    self.priceLabel.attributedText = str;
    
}

-(void)createLabel
{
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.priceLabel.size = self.size;
}

@end
