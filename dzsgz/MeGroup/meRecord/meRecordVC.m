//
//  meRecordVC.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/28.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "meRecordVC.h"

@interface meRecordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  * tab;
@property (nonatomic,strong)NSMutableArray * arr;
@end

@implementation meRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.arr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
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
