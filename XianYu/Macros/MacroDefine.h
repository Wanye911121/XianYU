//
//  MacroDefine.h
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h


//颜色
#define XYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//黄色导航栏
#define NavBarColor XYColor(250,227,111)
#define GrayBarColor XYColor(240,240,240)

#define BackgroundColor XYColor(233,233,233)
//定位颜色
#define LocateColor XYColor(61,181,230)

//尺寸
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define TabBarHeight 49

#endif /* MacroDefine_h */
