//
//  wertyuProgressView.h
//  GMSDKDemo
//
//  Created by GM on 2018/11/18.
//  Copyright © 2018年 GM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wertyuProgressView : UIView
@property (nonatomic, assign) CGFloat progress;
//进度条颜色
@property(nonatomic,strong) UIColor *progerssColor;
//进度条背景颜色
@property(nonatomic,strong) UIColor *progerssBackgroundColor;
//进度条边框的颜色
@property(nonatomic,strong) UIColor *progerssStokeBackgroundColor;
//进度条边框的宽度
@property(nonatomic,assign) CGFloat progerStokeWidth;

@end
