//
//  HomeCollectionViewCell.m
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    
    self.noticeLabel.layer.cornerRadius = 4;
    self.noticeLabel.layer.masksToBounds = YES;
    self.noticeLabel.layer.borderWidth = 1;
    self.noticeLabel.layer.borderColor = self.noticeLabel.textColor.CGColor;
    // Initialization code
}

@end
