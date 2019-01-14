//
//  loadVC.h
//  ProjectTemplate
//
//  Created by GM on 2018/12/25.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "RootBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface loadVC : RootBaseVC
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkNumTextField;
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIButton *getCheckNum;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTop;

@end

NS_ASSUME_NONNULL_END
