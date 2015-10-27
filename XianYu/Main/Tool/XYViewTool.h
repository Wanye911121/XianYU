//
//  ViewTool.h
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYViewTool : NSObject
#pragma mark 给视图添加细线
+(void) setLineFatherView:(UIView*)view lineFrame:(CGRect)rect lineColor:(UIColor*)color;
@end
