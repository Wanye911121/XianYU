//
//  HomeGoodsTableViewCell.m
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "HomeGoodsTableViewCell.h"
#import "HomeGoodsFrame.h"
#import "HomeGoodsModel.h"
#import "NSString+Extension.h"
#import "HomePriceView.h"

#define PicPadding 5
#define CellPadding 10
#define PicHeight (SCREEN_WIDTH - CellPadding*2-2*PicPadding)/3

@interface HomeGoodsTableViewCell()
@property (nonatomic,weak) UIView *backView;
@property (nonatomic,weak) UIImageView *headIconView;
@property (nonatomic,weak) UILabel *nickNameLabel;
@property (nonatomic,weak) HomePriceView *priceView;
@property (nonatomic,weak) UILabel *addTimeLabel;
@property (nonatomic,weak) UILabel *contentLabel;
@property (nonatomic,weak) UIImageView *levelView;
@property (nonatomic,weak) UIButton *locateBtn;
@property (nonatomic,weak) UIButton *assessBtn;
@property (nonatomic,weak) UIView *photosView;
@end

@implementation HomeGoodsTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Trends";
    HomeGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HomeGoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = BackgroundColor;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.opaque = YES;
        
        [self createGoodsView];
    }
    return self;
}

-(void)createGoodsView
{
    UIView *backGroundView= [[UIView alloc] init];
    backGroundView.backgroundColor = [UIColor whiteColor];
    backGroundView.layer.shadowColor = [UIColor blackColor].CGColor;
    backGroundView.layer.shadowOffset = CGSizeMake(1, 1);
    backGroundView.layer.shadowOpacity = 0.5;
    [self.contentView addSubview:backGroundView];
    self.backView = backGroundView;
    
    UIImageView *headIcon = [[UIImageView alloc] init];
    [backGroundView addSubview:headIcon];
    self.headIconView = headIcon;
    
    UILabel *nickName = [[UILabel alloc] init];
    nickName.textColor = [UIColor blackColor];
    nickName.font = [UIFont systemFontOfSize:14];
    [backGroundView addSubview:nickName];
    self.nickNameLabel = nickName;
    
    UIImageView *vipIcon = [[UIImageView alloc] init];
    [backGroundView addSubview:vipIcon];
    self.levelView = vipIcon;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.textColor = [UIColor lightGrayColor];
    timeLabel.font = [UIFont systemFontOfSize:12];
    [backGroundView addSubview:timeLabel];
    self.addTimeLabel = timeLabel;
    
    HomePriceView *priceLabel = [[HomePriceView alloc] init];
    [backGroundView addSubview:priceLabel];
    self.priceView = priceLabel;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 2;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = [UIColor blackColor];
    [backGroundView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIView *photosView = [[UIView alloc] init];
    [backGroundView addSubview:photosView];
    self.photosView = photosView;
    
    
    UIButton *locateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    locateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [locateBtn setImage:[UIImage imageNamed:@"my_city_position_green"] forState:UIControlStateNormal];
    [locateBtn setTitleColor:LocateColor forState:UIControlStateNormal];
    locateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [locateBtn addTarget:self action:@selector(locateDidClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [backGroundView addSubview:locateBtn];
    self.locateBtn = locateBtn;
    
    
    UIButton *assessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [assessBtn setBackgroundImage:[UIImage imageNamed: @"meta_action"] forState:UIControlStateNormal];
    [assessBtn addTarget:self action:@selector(assessBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    assessBtn.size = assessBtn.currentBackgroundImage.size;
    [backGroundView addSubview:assessBtn];
    self.assessBtn = assessBtn;
}

-(void)setGoodFrame:(HomeGoodsFrame *)goodFrame
{
    _goodFrame = goodFrame;
    HomeGoodsModel *goodModel = goodFrame.goodModel;
    
    self.backView.frame = goodFrame.backgroundViewF;
    
    self.headIconView.frame = goodFrame.headIconViewF;
    [self.headIconView sd_setImageWithURL:[NSURL URLWithString:goodModel.headIcon] placeholderImage:[UIImage imageNamed:@"avatar_placehold"]];
    
    self.nickNameLabel.frame = goodFrame.nickNameLabelF;
    self.nickNameLabel.text = goodModel.nickName;
    
//    self.levelView.frame = goodFrame.levelLabelF;
//    self.levelView sd_setImageWithURL:[NSURL URLWithString:goodModel.level] placeholderImage:<#(UIImage *)#>

    self.priceView.frame = goodFrame.priceLabelF;
    [self.priceView addOriginStr:goodModel.orignPrice realStr:goodModel.realPrice];


    self.addTimeLabel.frame = goodFrame.addTimeLabelF;
    self.addTimeLabel.text = [NSString addtime:goodModel.addTime];
    
    if (goodModel.pics.count>0) {
        
        [goodModel.pics enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"placeholder240x240"]];
            imageView.frame= CGRectMake(idx *PicHeight+idx * PicPadding, 0, PicHeight, PicHeight);
            [self.photosView addSubview:imageView];
        }];
        self.photosView.hidden = NO;
        self.photosView.frame = goodFrame.picsViewF;
    }else{
        self.photosView.hidden = YES;
    }

    self.contentLabel.frame = goodFrame.contentF;
    self.contentLabel.text = goodModel.content;
    
    self.locateBtn.frame = goodFrame.locationBtnF;
    
    [self.locateBtn setTitle:[NSString stringWithFormat:@"来自%@",goodModel.location] forState:UIControlStateNormal];
    
    self.assessBtn.frame = goodFrame.assessBtnF;
}

-(void)locateDidClickEvent:(UIButton *)btn
{
    
}
-(void)assessBtnDidClick:(UIButton *)btn
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
