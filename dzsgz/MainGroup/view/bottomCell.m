//
//  bottomCell.m
//  ProjectTemplate
//
//  Created by GM on 2018/12/24.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "bottomCell.h"

@implementation bottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    self.layer.borderWidth  = 1;
    //self.layer.borderColor  = CLineColor.CGColor;
    // Initialization code
}
- (void)setData:(NSDictionary *)data{
    _data = data;
    self.promptLab.text  =[data objectForKey:@"prompt"];
    self.detailLab.text  =[data objectForKey:@"detaile"];
}
@end
