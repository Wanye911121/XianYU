//
//  XYTabBar.h
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYTabBar;

@protocol XYTabBarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(XYTabBar *)tabBar;
@end

@interface XYTabBar : UITabBar
@property (nonatomic,weak) id<XYTabBarDelegate> delegate;
@end
