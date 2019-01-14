//
//  loadVC.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/25.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "loadVC.h"
#import "DBInfo.h"
@interface loadVC ()

@end

@implementation loadVC

- (void)viewDidLoad {
    [super viewDidLoad];
      CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
    self.btnTop.constant= StatusRect.size.height;
   // self.view.backgroundColor = CViewBgColor;
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backInview:(UIButton *)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)login:(UIButton *)sender {
    [DBInfo saveLoadStatus:1];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
