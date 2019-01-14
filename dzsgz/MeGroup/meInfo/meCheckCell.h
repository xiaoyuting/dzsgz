//
//  meCheckCell.h
//  ProjectTemplate
//
//  Created by GM on 2018/12/25.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface meCheckCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *checkStatus;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *detaileLab;

@property (weak, nonatomic) IBOutlet UILabel *promptLab;
@property (nonatomic,strong) NSDictionary   * dic;
@end

NS_ASSUME_NONNULL_END
