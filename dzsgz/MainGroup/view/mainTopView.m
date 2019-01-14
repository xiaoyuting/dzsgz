//
//  mainTopView.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/24.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "mainTopView.h"

@implementation mainTopView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [ super initWithFrame:frame]){
       
        
        CGFloat w = frame.size.width;
       
        self.bottomView = [[UIView alloc]init];
        self.bottomView.layer.masksToBounds =YES;
        self.bottomView.layer.cornerRadius =8;
        
        self.bottomView.layer.borderWidth =1;
        [self addSubview:self.bottomView];
        
        self.topLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, w-40, 20)];
        self.topLab.font = BOLDSYSTEMFONT(20);
        self.topLab.textColor = [UIColor blackColor];
        [self addSubview:self.topLab];
        
        self.promptMoneyLab = [[UILabel alloc]init ];
        self.promptMoneyLab.font =SYSTEMFONT(12);
       
        self.promptMoneyLab.textAlignment   = NSTextAlignmentCenter;
        [self addSubview:self.promptMoneyLab];
        
        self.accountMoneyLab = [[UILabel alloc]init ];
        self.accountMoneyLab.textAlignment =NSTextAlignmentCenter;
        [self addSubview:self.accountMoneyLab];
        
        self.dayMoneyLab = [[UILabel alloc]init ];
        self.dayMoneyLab.font =SYSTEMFONT(11);
        self.dayMoneyLab.layer.masksToBounds =YES;
        self.dayMoneyLab.layer.cornerRadius =10;
        self.dayMoneyLab.textAlignment  = NSTextAlignmentCenter;
        [self addSubview:self.dayMoneyLab];
        
        self.pullMoneyBtn = [[UIButton alloc]init ];
        self.pullMoneyBtn.backgroundColor = [UIColor orangeColor];
        self.pullMoneyBtn.layer.cornerRadius =5;
        self.pullMoneyBtn.layer.masksToBounds =YES;
        [self addSubview:self.pullMoneyBtn];
        [self.pullMoneyBtn addTarget:self action:@selector(pullMethod ) forControlEvents:UIControlEventTouchUpInside];
        
        
        self.botomLab = [[UILabel alloc]init ];
        self.botomLab.font = BOLDSYSTEMFONT(20);
        self.botomLab.textColor = [UIColor blackColor];
        [self addSubview:self.botomLab];
        //WithFrame:CGRectMake(20, self.topLab.bottom+20, w-40, 15)
    }
    return self;
}
- (void)pullMethod{
    if(self.pulBlock){
        self.pulBlock();
    }
}
@end
