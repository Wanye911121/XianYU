//
//  UIBarButtonItem+Extension.h
//  weibo
//
//  Created by ZpyZp on 15/3/16.
//  Copyright (c) 2015年 Zpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  创建item
 *
 *  @param target         调用哪个对象的方法
 *  @param action         跳用target的哪个方法
 *  @param Image          <#Image description#>
 *  @param highlightImage <#highlightImage description#>
 *
 *  @return <#return value description#>
 */
+(UIBarButtonItem *)CreateItemWithTarget:(id)target ForAction:(SEL)action WithImage:(NSString *)Image WithHighlightImage :(NSString *)highlightImage;
@end
