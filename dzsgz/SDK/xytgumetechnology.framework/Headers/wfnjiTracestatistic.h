//
//  wfnjiTracestatistic.h
//  wfnjiSDK
//
//  Created by wfnji on 2017/12/20.
//  Copyright © 2017年 wfnji. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger ,  selectStyle) {
    selectStyleCreateTheRole   = 1 ,
    selectStyleCompleteNewbieGuide
    
};
@interface wfnjiTracestatistic : NSObject
@property (nonatomic,assign) BOOL   EnterForeground;
@property (nonatomic,copy) NSString  * nowTime;

+(wfnjiTracestatistic *)Trace;
+(void)setName:(NSString *)name   type:(NSString *)type  page_action:(NSString *)page_action;
-(void)addUserNewbieguide:(selectStyle)way;
-(void)heartBeatUpLoadInfo;
-(void)heartBeatRequest:(BOOL)backOrFore TS:(NSString *)time;
+ (void)setGameRoleName:(NSString *)name gameLevel:(NSString *)level serverID:(NSString *)serverID status:(NSString *)status;
@end
