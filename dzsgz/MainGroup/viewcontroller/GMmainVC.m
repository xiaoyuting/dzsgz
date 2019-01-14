//
//  GMmainVC.m
//  ProjectTemplate
//
//  Created by xy on 2017/11/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "GMmainVC.h"

#import "UITapGestureRecognizer+Block.h"
#import "WRNavigationBar.h"
#import "SDCycleScrollView.h"
#import "GMHomeRequest.h"
#import "mainTopView.h"
#import "bottomCell.h"
#import "loadVC.h"
#import "DBInfo.h"
@interface GMmainVC ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) SDCycleScrollView * advView;
@property (nonatomic, strong) SDCycleScrollView * adTacticView;
@property (nonatomic, strong) SDCycleScrollView * adNewsView;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, assign) CGFloat  oldOffset;
@property (nonatomic, strong) NSMutableArray  * dataArr;
@property (nonatomic,strong)  UICollectionView *  CollectView;


@property (nonatomic,strong) mainTopView  * topview;

@end

@implementation GMmainVC

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    [self setupNavItems ];
 
 
    [self setSubviews];
}

- (void)setupNavItems
{
   
   
 
    
  
 
}
- (void)setSubviews{
     self.dataArr = [NSMutableArray array];
    [self.dataArr addObjectsFromArray:@[@{@"image":@"",@"prompt":@"wqewqewq",@"detaile":@"qwewqewqewewewqewq"},@{@"image":@"",@"prompt":@"wqewqewq",@"detaile":@"qwewqewqewewewqewq"},@{@"image":@"",@"prompt":@"wqewqewq",@"detaile":@"qwewqewqewewewqewq"},@{@"image":@"",@"prompt":@"wqewqewq",@"detaile":@"qwewqewqewewewqewq"}]];
    self.title =@"520优选";
    self.topview = [[mainTopView alloc]initWithFrame:CGRectMake(0, [self naviGationH], KScreenWidth , 220)];
    self.topview.topLab.text =@"借钱";
    self.topview.promptMoneyLab.text  =@"可借金额(元)";
    self.topview.accountMoneyLab.text =@"300000";
    self.topview.dayMoneyLab.text =@" ";
    self.navigationController.tabBarItem.title =@"首页";
    self.topview.botomLab.text =@" ";
    [self.view addSubview:self.topview];
    [self.view addSubview:self.CollectView];
    __weak typeof(self) weakSelf = self;
    self.topview.pulBlock = ^{
        if([DBInfo  getLoginStatus]==1){
            
        }else{
//            loadVC *vc = [[loadVC alloc]initWithNibName:[loadVC className] bundle:nil];
//            [weakSelf presentViewController:vc animated:YES  completion:nil];
        }
    };
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [DBInfo saveLoadStatus:0];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    NSArray * weathers = @[@"晴", @"多云", @"小雨", @"大雨", @"雪", @""];
     NSString *weather = weathers[arc4random() % weathers.count];
//     if(!kiOSBefore){
//        [self setAppIconWithName:weather];
//
//     }
}
- (void)setAppIconWithName:(NSString *)iconName {
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}



- (UICollectionView *)CollectView{
    if(!_CollectView){
        CGFloat padding   = 20;
        CGFloat cellWight = KScreenWidth-80;
        UICollectionViewFlowLayout * layout =[UICollectionViewFlowLayout new];
        layout .itemSize = CGSizeMake(cellWight, 180);
        layout .sectionInset = UIEdgeInsetsMake(padding, padding, padding, padding);
        layout .minimumLineSpacing = 20;
        layout .minimumInteritemSpacing =0;
        layout .scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _CollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, [self naviGationH]+220, KScreenWidth, 220) collectionViewLayout:layout];
        _CollectView.backgroundColor = [UIColor whiteColor];
        _CollectView.alwaysBounceHorizontal = YES;
        _CollectView.alwaysBounceVertical   = YES;
        _CollectView.delegate =self;
        _CollectView.dataSource =self;
         [_CollectView registerNib:[UINib nibWithNibName:NSStringFromClass(bottomCell.class) bundle:nil] forCellWithReuseIdentifier:@"cellID"];
     
    }
    return _CollectView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    bottomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.data = self.dataArr[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    loadVC *vc = [[loadVC alloc]initWithNibName:[loadVC className] bundle:nil];
//    [self presentViewController:vc animated:YES  completion:nil];
}
@end
