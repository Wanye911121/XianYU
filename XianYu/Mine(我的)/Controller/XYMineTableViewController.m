//
//  XYMineTableViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYMineTableViewController.h"
#import "XYSettingTableViewController.h"
#import "XYLoginViewController.h"
#import "XYNavigationController.h"

static CGFloat FirstCellHeight = 100;
static CGFloat CellHeight = 44;

@interface XYMineTableViewController ()
@property (nonatomic,strong) NSArray *listArray;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation XYMineTableViewController

-(NSArray *)listArray
{
    if (!_listArray) {
        self.listArray = @[@[@"您还没有登录哦"],@[@"我发布的",@"我卖出的",@"我买到的"],@[@"我收藏的"],@[@"设置"]];
        self.imageArray = @[@[@"avatar_placehold"],@[@"icon_account_selling",@"icon_account_sold",@"icon_account_buy"],@[@"icon_account_favorite"],@[@"icon_account_settings"]];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeNav];

}

-(void)changeNav
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
        case 2:
            return 1;
        case 3:
            return 1;
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MINECELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MINECELL"];
        cell.textLabel.font =[UIFont systemFontOfSize:14];
    }
    cell.textLabel.text = self.listArray[indexPath.section][indexPath.row];
    [cell.imageView setImage:[UIImage imageNamed:self.imageArray[indexPath.section][indexPath.row]]];
    
    if (indexPath.section!=0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [XYViewTool setLineFatherView:cell lineFrame:CGRectMake(0,CellHeight-1, SCREEN_WIDTH, 1) lineColor:BackgroundColor];
    }else{
        [XYViewTool setLineFatherView:cell lineFrame:CGRectMake(0,FirstCellHeight-1, SCREEN_WIDTH, 1) lineColor:BackgroundColor];
    }
    

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] init];
    [footView setBackgroundColor:BackgroundColor];
    return footView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return FirstCellHeight;
            break;
        case 1:
        case 2:
        case 3:
            return CellHeight;
        default:
            return 0;
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section!=3) {
        XYLoginViewController *loginVC = [[XYLoginViewController alloc] init];
       XYNavigationController *nav = [[XYNavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }else{
    
        XYSettingTableViewController *settingVC = [[XYSettingTableViewController alloc] init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
}


@end
