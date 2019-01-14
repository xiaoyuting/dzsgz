//
//  meCheckCenter.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/25.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "meCheckCenter.h"
#import "meCheckCell.h"
#import "upLoadVC.h"
static NSString * const checkCellID =@"checkcell";
@interface meCheckCenter ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  * tab;
@property (nonatomic,strong)NSMutableArray  * arr;

@end

@implementation meCheckCenter
- (UIView *)headView{
    UIView * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    
    UIImageView  * topLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1)];
   // topLine.backgroundColor =CLineColor;
    [head addSubview:topLine];
    
    UILabel  * lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 20)];
    lab.center =head.center;
    lab.font =SYSTEMFONT(12);
    lab.text  =@"请提交以下资料,获取借款资格";
    lab.textAlignment = NSTextAlignmentCenter;
    [head addSubview:lab];
    
    UIImageView  * botLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 199, KScreenWidth, 1)];
    //botLine.backgroundColor =CLineColor;
    [head addSubview:botLine];
    return head;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"认证中心";
    [self setNavLeftItemTitle:nil  andImage:[UIImage imageNamed:@"back"]];
 
 
    [self setSubviews];
    
}
- (void)leftItemClick:(id)sender{

    [self popNav];
}


- (void)setSubviews{
    self.tab = [[UITableView alloc]initWithFrame:CGRectMake(0, [self naviGationH], KScreenWidth, KScreenHeight-[self naviGationH]) style:UITableViewStylePlain];
    self.tab.delegate =self;
    self.tab.dataSource =self;
//    [self.tab registerNib:[UINib nibWithNibName:[meCheckCell className] bundle:nil ] forCellReuseIdentifier:checkCellID];
    
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone ;
    [self.view addSubview:self.tab];
    self.tab.tableHeaderView = [self headView];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    meCheckCell * cell  =[tableView dequeueReusableCellWithIdentifier:checkCellID];
    if(!cell){
        cell =[[meCheckCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:checkCellID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    cell.dic =self.arr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.row==0){
        upLoadVC  * vc = [[upLoadVC alloc]init];
        [self pushViewController:vc  animated:YES];
    }
}
@end
