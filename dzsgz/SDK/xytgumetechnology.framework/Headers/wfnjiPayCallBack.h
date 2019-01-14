//
//  wfnjiPayCallBack.h
//  Mili
//
//  Created by mili on 2016/10/31.
//  Copyright © 2016年 wfnji. All rights reserved.
//

#ifndef wfnjiPayCallBack_h
#define wfnjiPayCallBack_h

#import <Foundation/Foundation.h>
#import "wfnjiStatus.h"
#import "wfnjiOpenMix.h"


/**
 支付返回代理，需在调用支付前实例化
 */
@protocol wfnjiPayCallBack <NSObject>

@required
/**
 接口
 @param code 状态值
 @param desc 状态说明
 @param Data 数据
 */
-(void)onFinish:(wfnjiStatus)code   Data:(NSDictionary*)Data;

@end
#endif /* wfnjiPayCallBack_h */
