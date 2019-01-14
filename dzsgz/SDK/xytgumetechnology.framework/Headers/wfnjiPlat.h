//
//  wfnjiPlat.h
//
//  Created by wfnji on 16/8/15.
//  Copyright © 2016年 wfnji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wfnjiUserInfo.h"
#import "wfnjiLoginCallBack.h"
#import "wfnjiPayCallBack.h"
#import "OrderModel.h"
#import "wfnjiOpenMix.h"
#import "wfnjiTracestatistic.h"
 

/**
 游戏接入用到接口类
 */
@interface wfnjiPlat : NSObject

/*!
 单例,预留接口
 
 @return wfnjiPlat
 */
+(wfnjiPlat*)getInstance;

/**
 AppDelegate.h内的接口,主要用去支付.游戏从后台返回用
 
 @param application application
 */
+(void)applicationWillEnterForeground:(UIApplication *)application;

/*
 
 要针对所有广告系列（包括使用通用链接的广告系列）将应用内事件作为转化衡量，
 您必须将以下代码段添加到应用的 application:continueUserActivity:restorationHandler 方法。
 */
+ (BOOL)application:(UIApplication *)application  continueUserActivity:(NSUserActivity *)userActivity;

/**
 AppDelegate.h内的接口,主要用去支付. 支付结束,返回游戏
 
 @param app app
 @param url url
 @param options options
 @return BOOL
 */
+(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;

/**
 AppDelegate.h内的接口,主要用去支付. 支付结束,返回游戏
 
 @param application application
 @param url url
 @param sourceApplication sourceApplication
 @param annotation annotation
 @return BOOL
 */
+(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;



+ (void)applicationDidBecomeActive:(UIApplication *)app;



/**
 必须最先接入的方法  平台初始化方法
 
 @param gameid 游戏的id
 @param promote 渠道
 
 */
+ (void) initSDK:(NSString*)gameid
      setPromote:(NSString*)promote
     application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 appsFlyerDevKey:(NSString *)devKey
      appleAppID:(NSString *)appID;

/**
 必须接入的方法  登录
 
 @param mLoginCallBack 回调
 */
+ (void) login:(id<wfnjiLoginCallBack>)mLoginCallBack;

/**
 支付时需要调用的方法
 
 @param payInfo 参数
 @param callBack 回调
 */
+ (void) wfnjipay:(OrderModel *)payInfo CallBack:(id<wfnjiPayCallBack>) callBack;

/**
 查看当前的登录状态
 
 @return true or false
 */
+ (BOOL) isLogin;

/**
 注销账号
 */
+ (void) logout;


/**
 获取用户信息
 
 @return 用户信息
 */
+(wfnjiUserInfo*)getUserInfo;

/**
 获取游戏用户的唯一ID
 
 @return uid
 */
+ (NSString*) getUid;


/**
 获取用户名
 
 @return Nickname
 */
+ (NSString*) getNickname;

/**
 获取Token
 
 @return Token
 */
+ (NSString*) getToken;


/**
 游戏中调用返回提示，部分SDK需要调用SDK的退出提示，暂时没用,预留接口
 */
+ (void) quit;

/**
 获取当前 SDK 的版本号
 
 @return SDK 版本号，用Jenkins 打包会自动加上时间戳
 */
+(NSString*)versions;
/*
 获取当前游戏用户注册或新手引导
 */
+(void)wfnjicreateTheRoleOrCompleteNewbieGuide:(selectStyle)selectStyle;
/**
 
 获取当前游戏的角色
 角色名字：name
 游戏等级：level
 区服:   serverID
 状态值默认选择<3>:status
 */
+ (void)wfnjiRoleName:(NSString *)name  gameLevel:(NSString *)level serverID:(NSString *)serverID status:(NSString *)status;

/**
 发起内购的加载loading
 开启
 */
+(void)setLoadingOn;

/**
 发起内购的加载loading
 关闭
 */
+(void)setLoadingOff;


+ (NSString *)setlaugulgString:(NSString *)str;
@end

