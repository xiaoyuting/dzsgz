//
//  GMmeVC.m
//  ProjectTemplate
//
//  Created by 雨停 on 2017/11/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "GMmeVC.h"
#import "WRNavigationBar.h"
#import "meCell.h"
#import "meCheckCenter.h"
#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 220
#define NAV_HEIGHT 64
@interface GMmeVC ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *topView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *fansLabel;
@property (nonatomic, strong) UILabel *detailsLabel;
@property (nonatomic,strong) NSArray  * arr;
@end

@implementation GMmeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
    self.arr =@[@"信息认证",@"借款记录",@"银行卡",@"联系客服",@"设置"];
    [self.view addSubview:self.tableView];
    [self.topView addSubview:self.iconView];
    self.iconView.center = CGPointMake(60, self.topView.center.y - 10);
    [self.topView addSubview:self.phoneLabel];
    self.phoneLabel.center = self.topView.center;
 
    self.tableView.tableHeaderView = self.topView;
 
    // 设置导航栏颜色
    [self wr_setNavBarBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY > NAVBAR_COLORCHANGE_POINT)
//    {
//        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
//        [self wr_setNavBarBackgroundAlpha:alpha];
//        [self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
//        [self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
//        [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
//         self.navigationItem.title = @"my title";
//        //self.tabBarController.tabBarItem.title =@"wqewqewq";
//    }
//    else
//    {
//        [self wr_setNavBarBackgroundAlpha:0];
//        [self wr_setNavBarTintColor:[UIColor whiteColor]];
//        [self wr_setNavBarTitleColor:[UIColor whiteColor]];
//        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
//        //self.title = @"";
//          self.navigationItem.title = @"";
//    }
//}
//

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString * strID  =@"meCellID";
    meCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if(!cell){
        cell  =[[meCell   alloc]initWithStyle:UITableViewCellStyleDefault     reuseIdentifier:strID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    cell.nameLab.text = self.arr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.row==0){
        meCheckCenter * vc = [[meCheckCenter alloc]init];
        [self pushViewController:vc animated:YES];
    }
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(-[self navBarBottom], 0, 0, 0);
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([meCell class]) bundle:nil] forCellReuseIdentifier:@"meCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)topView
{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wbBG"]];
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, IMAGE_HEIGHT);
    }
    return _topView;
}

- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine@3x.png"]];
        _iconView.bounds = CGRectMake(0, 0, 80, 80);
        _iconView.layer.cornerRadius = 40;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

- (UILabel *)phoneLabel
{
    if (_phoneLabel == nil) {
        _phoneLabel = [UILabel new];
        _phoneLabel.backgroundColor = [UIColor clearColor];
        _phoneLabel.textColor = [UIColor whiteColor];
        _phoneLabel.text = @"mine@3x";
        _phoneLabel.bounds  = CGRectMake(0, 0, 100, 20);
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
        _phoneLabel.font = [UIFont systemFontOfSize:17];
    }
    return _phoneLabel;
}

- (UILabel *)fansLabel
{
    if (_fansLabel == nil) {
        _fansLabel = [UILabel new];
        _fansLabel.backgroundColor = [UIColor clearColor];
        _fansLabel.textColor = [UIColor whiteColor];
        _fansLabel.text = @"关注 121  |  粉丝 117";
        _fansLabel.textAlignment = NSTextAlignmentCenter;
        _fansLabel.font = [UIFont systemFontOfSize:14];
    }
    return _fansLabel;
}

- (UILabel *)detailsLabel
{
    if (_detailsLabel == nil) {
        _detailsLabel = [UILabel new];
        _detailsLabel.backgroundColor = [UIColor clearColor];
        _detailsLabel.textColor = [UIColor whiteColor];
        _detailsLabel.text = @"简介:丽人丽妆公司，熊猫美妆APP iOS工程师";
        _detailsLabel.textAlignment = NSTextAlignmentCenter;
        _detailsLabel.font = [UIFont systemFontOfSize:13];
    }
    return _detailsLabel;
}

- (int)navBarBottom
{
    return [self naviGationH];
}

@end
