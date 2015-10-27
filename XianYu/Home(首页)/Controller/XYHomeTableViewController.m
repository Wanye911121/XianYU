//
//  XYHomeTableViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYHomeTableViewController.h"
#import "AdView.h"
#import "XYLineLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeGoodsFrame.h"
#import "HomeGoodsTableViewCell.h"
#import "HomeGoodsModel.h"

static NSString *const ID =@"collectionCell";

@interface XYHomeTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *YTList;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) AdView *adView;
@property (nonatomic,weak) UITableView *goodListView;
@property (nonatomic,weak) UIView *headView;

@property (nonatomic,strong) NSMutableArray *goodListFrame;
@end

@implementation XYHomeTableViewController

-(NSMutableArray *)goodListFrame
{
    if (!_goodListFrame) {
        self.goodListFrame = [NSMutableArray array];
    }
    return _goodListFrame;
}

-(NSMutableArray *)YTList
{
    if (!_YTList) {
        self.YTList = [[NSMutableArray alloc] init];
        for (int i = 1; i<=20; i++) {
            [self.YTList addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return  _YTList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeNav];
    [self.view setBackgroundColor:BackgroundColor];
    
    [self createHeadView];
    
    //初始化轮播图
    [self createScrollView];
    //初始化横版滚动图
    [self createLandscapeScrollView];
    
    //初始化列表
    [self createTableView];
    
    [self createLocalData];
    
}

-(NSArray *)trendsFrameWithStatus:(NSArray *)trendsArray
{
    //将trends模型数组转化为trendsframe模型数组
    NSMutableArray *trendsFrameArray = [NSMutableArray array];
    for (HomeGoodsModel *good in trendsArray) {
        HomeGoodsFrame *f =[[HomeGoodsFrame alloc] init];
        f.goodModel = good;
        [trendsFrameArray addObject:f];
    }
    return trendsFrameArray;
}

-(void)createLocalData
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        HomeGoodsModel *goodModel = [[HomeGoodsModel alloc] init];
        goodModel.nickName = [NSString stringWithFormat:@"张三%d",i];
        goodModel.addTime = @"1435912294000";
        goodModel.headIcon = @"";
        goodModel.realPrice = @"100";
        goodModel.orignPrice = @"150";
        goodModel.pics = @[@"",@"",@""];
        goodModel.content = @"大菩萨挂件，贩子远离点 精品挂件，平安，吉祥，聚财，寓意深远，有想要此物者留言";
        goodModel.location = @"沈阳 沈阳音乐学院";
        [arr addObject:goodModel];
    }
    NSArray *trendsFrame = [self trendsFrameWithStatus:arr];
    [self.goodListFrame addObjectsFromArray:trendsFrame];
}

-(void)createHeadView
{
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 230+SCREEN_WIDTH/2);
    headView.backgroundColor = BackgroundColor;
    [self.view addSubview:headView];
    self.headView = headView;
}

-(void)createTableView
{
    UITableView *goodsListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH,SCREEN_HEIGHT-49) style:UITableViewStylePlain];
    goodsListTableView.backgroundColor = BackgroundColor;
    goodsListTableView.delegate = self;
    goodsListTableView.dataSource = self;
    goodsListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    goodsListTableView.showsVerticalScrollIndicator = NO;
    self.goodListView = goodsListTableView;
    [self.view addSubview:goodsListTableView];
    
    goodsListTableView.tableHeaderView = self.headView;
}

-(void)createLandscapeScrollView
{
    CGFloat w = self.view.bounds.size.width;
    CGRect frame = CGRectMake(0,CGRectGetMaxY(self.adView.frame), w, 230);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:[[XYLineLayout alloc] init]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = BackgroundColor;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.headView addSubview:collectionView];
    self.collectionView = collectionView;
}

-(void)createScrollView
{
    NSArray *imagesURL = @[
                           @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                           @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                           @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg"
                           ];
    AdView *AdScrollView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/2)
                              imageLinkURL:imagesURL
                    placeHoderImageName:@"page_loading_fish"
                      pageControlShowStyle:UIPageControlShowStyleCenter];
    
    //    是否需要支持定时循环滚动，默认为YES
        AdScrollView.isNeedCycleRoll = YES;

    //    设置图片滚动时间,默认3s
        AdScrollView.adMoveTime = 3.0;
    
    //图片被点击后回调的方法
    AdScrollView.callBack = ^(NSInteger index,NSString * imageURL)
    {
        NSLog(@"被点中图片的索引:%ld---地址:%@",index,imageURL);
    };
    [self.headView addSubview:AdScrollView];
    self.adView = AdScrollView;

}

-(void)changeNav
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"";
    XYButton *titleView = [XYButton buttonWithType:UIButtonTypeCustom];
    [titleView setBackgroundImage:[UIImage imageNamed:@"home_title_slogan"] forState:UIControlStateNormal];
    titleView.size = titleView.currentBackgroundImage.size;
    self.navigationItem.titleView =  titleView;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(searchClick) WithImage:@"icon_fishpond_search" WithHighlightImage:@"icon_fishpond_search"];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(scanClick) WithImage:@"scan_icon" WithHighlightImage:@"scan_icon"];
    
}

#pragma mark -代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.YTList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath ];
//    cell.image = self.YTList[indexPath.item];
    return cell;
}

#pragma mark - tableview代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodListFrame.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeGoodsFrame *goodFrame = self.goodListFrame[indexPath.row];
    
    return goodFrame.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeGoodsTableViewCell *cell = [HomeGoodsTableViewCell cellWithTableView:tableView];
    cell.goodFrame = self.goodListFrame[indexPath.row];
//    cell.delegate = self;
    
    return cell;
}


-(void)searchClick
{
    
}

-(void)scanClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
