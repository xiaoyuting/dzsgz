//
//  mainTopView.h
//  ProjectTemplate
//
//  Created by GM on 2018/12/24.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^pullBlock)();
@interface mainTopView : UIView
@property (nonatomic,strong)UILabel * topLab;
@property (nonatomic,strong)UILabel * botomLab;
@property (nonatomic,strong)UILabel * promptMoneyLab;
@property (nonatomic,strong)UILabel * accountMoneyLab;
@property (nonatomic,strong)UILabel * dayMoneyLab;
@property (nonatomic,strong)UIButton * pullMoneyBtn;
@property (nonatomic,strong)UIView   * bottomView;
@property (nonatomic,copy)pullBlock pulBlock;
@end

NS_ASSUME_NONNULL_END
