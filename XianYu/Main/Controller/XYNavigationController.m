//
//  XYNavigationController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYNavigationController.h"
#import "UIBarButtonItem+Extension.h"
@interface XYNavigationController ()

@end

@implementation XYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"%lu %@",(unsigned long)self.viewControllers.count,viewController);
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed=YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(back) WithImage:@"header_back_icon" WithHighlightImage:@"header_back_icon_highlight"];
        
        //        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(more) WithImage:@"navigationbar_more" WithHighlightImage:@"navigationbar_more_highlighted"];
        
    }
    [super pushViewController:viewController animated:animated];
}


    
    
    
//
-(void)back
{
    [self popViewControllerAnimated:YES];
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
