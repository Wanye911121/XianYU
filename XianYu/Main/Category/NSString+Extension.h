//
//  NSString+Extentsion.h
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Extension.h"
@interface NSString (Extension)

/**
 时间戳转化为具体时间
 */
+(NSString *)addtime:(NSString *)time;

/**
 label自适应
 */
-(CGSize)sizeWithTextfont:(UIFont *)font maxW:(CGFloat)maxW;
-(CGSize)sizeWithTextfont:(UIFont *)font;
@end
