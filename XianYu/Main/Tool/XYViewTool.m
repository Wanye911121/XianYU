//
//  ViewTool.m
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYViewTool.h"

@implementation XYViewTool
#pragma mark 给视图添加细线
+ (void)setLineFatherView:(UIView*)view lineFrame:(CGRect)rect lineColor:(UIColor*)color
{
    UILabel *lineLab = [[UILabel alloc] initWithFrame:rect];
    lineLab.backgroundColor = color;
    [view sendSubviewToBack:lineLab];
    [view addSubview:lineLab];
}
@end
