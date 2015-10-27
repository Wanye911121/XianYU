//
//  XYLineLayout.m
//  XianYu
//
//  Created by ZpyZp on 15/10/26.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYLineLayout.h"

static const CGFloat ZPYLineLayoutItemH =210;
static const CGFloat ZPYLineLayoutItemW = 250;

@implementation XYLineLayout

-(instancetype)init
{
    if (self = [super init]) {
        //初始化，一次性
        
    }
    return self;
}
/**
 *  用来设置collectionView停止滚动的那一刻的位置
 *
 *  @param proposedContentOffset 原本scrollview停止滚动那一刻的位置
 *  @param velocity              滚动的速度
 *
 *  @return <#return value description#>
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //1.计算出scrollview最后会停留的范围
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    //2.取出这个范围内item属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat adjustX = MAXFLOAT;//默认最大
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //算出最小值
        if(ABS(attrs.center.x - centerX)<ABS(adjustX)){
            adjustX = attrs.center.x - centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x +adjustX, proposedContentOffset.y);
    
}

//一些初始化工作最好在这里实现，注只要重新刷新布局，下面两个方法都会重新调用
-(void)prepareLayout
{
    [super prepareLayout];
    //设置item的尺寸
    self.itemSize = CGSizeMake(ZPYLineLayoutItemW, ZPYLineLayoutItemH);
    //设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat inset = (self.collectionView.frame.size.width - ZPYLineLayoutItemW) *0.5;
    //切到左边右边上边下边
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    //设置每个cell之间的间距
    self.minimumLineSpacing = 10;
    //核心概念,每个cell都有自己的attributes
    //        UICollectionViewLayoutAttributes控制每个item的布局尺寸
}
/**
 *  意味着只要显示边界发生改变，是否重新布局：内部会重新调用layoutAttributesForElementsInRect方法获得所有cell的布局属性
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end

