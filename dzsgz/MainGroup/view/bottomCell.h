//
//  bottomCell.h
//  ProjectTemplate
//
//  Created by GM on 2018/12/24.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface bottomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Img;
@property (weak, nonatomic) IBOutlet UILabel *promptLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (strong,nonatomic) NSDictionary  * data;
@end

NS_ASSUME_NONNULL_END
