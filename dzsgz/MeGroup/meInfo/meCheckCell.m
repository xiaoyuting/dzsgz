//
//  meCheckCell.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/25.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "meCheckCell.h"

@implementation meCheckCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.promptLab.text = [dic objectForKey:@"prompt"];
    self.detaileLab.text = [dic objectForKey:@"detaile"];
    if([[dic objectForKey:@"status"] isEqualToString:@"0"]){
        self.checkStatus.text =@"未认证";
        
    }else{
        self.checkStatus.text =@"已认证";    }
}
@end
