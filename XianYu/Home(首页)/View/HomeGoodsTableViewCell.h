//
//  HomeGoodsTableViewCell.h
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeGoodsFrame;
@interface HomeGoodsTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) HomeGoodsFrame *goodFrame;
@end
