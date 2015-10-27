//
//  XYTabBarViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYTabBarViewController.h"
#import "XYMineTableViewController.h"
#import "XYDiscoverTableViewController.h"
#import "XYHomeTableViewController.h"
#import "XYNoticeTableViewController.h"
#import "XYSellerViewController.h"
#import "XYNavigationController.h"
#import "XYTabBar.h"

@interface XYTabBarViewController ()<XYTabBarDelegate>

@end

@implementation XYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    XYHomeTableViewController *home = [[XYHomeTableViewController alloc] init];
    [self createChildVCWithVC:home Title:@"首页" Image:@"home_normal" SelectedImage:@"home_highlight"];
    
    XYDiscoverTableViewController *discover = [[XYDiscoverTableViewController alloc] init];
    
    [self createChildVCWithVC:discover Title:@"同城" Image:@"mycity_normal" SelectedImage:@"mycity_highlight"];
    
    XYNoticeTableViewController *message = [[XYNoticeTableViewController alloc] init];
    [self createChildVCWithVC:message Title:@"消息" Image:@"message_normal" SelectedImage:@"message_highlight"];
    
    XYMineTableViewController *profile = [[XYMineTableViewController alloc] init];
    [self createChildVCWithVC:profile Title:@"我的" Image:@"account_normal" SelectedImage:@"account_highlight"];
    
    XYTabBar *tabBar = [[XYTabBar alloc] init];
    tabBar.delegate = self;
    [[XYTabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self setValue:tabBar forKey:@"tabBar"];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUInteger count = self.tabBar.subviews.count;
    for (int i = 0; i<count; i++) {
        UIView *child = self.tabBar.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = self.tabBar.width / count;
        }
    }
}

-(void)createChildVCWithVC:(UIViewController *)childVC Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage
{
    //设置子控制器的文字
    // childVC.tabBarItem.title =title;
    // childVC.navigationItem.title =title;
    //等价于
    childVC.title = title;//同时设置tabbar和navigation的标题
    //设置文字的样式
    NSMutableDictionary *textAttrs = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *selectedtextAttrs = [[NSMutableDictionary alloc]init];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedtextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    //设置子控制器的图片
    childVC.tabBarItem.image =[UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //这句话的意思是声明这张图片按照原始的样子显示出来，不要自动渲染成其他颜色
    
    // childVC.view.backgroundColor = RandomColor;
    
    //给子控制器包装导航控制器
    XYNavigationController *nav = [[XYNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

#pragma mark - tabbar代理方法
-(void)tabBarDidClickPlusButton:(XYTabBar *)tabBar
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];
    }];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takeFromAlbum];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:photoAction];
    [alertController addAction:albumAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)takePhoto
{

}

-(void)takeFromAlbum
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
