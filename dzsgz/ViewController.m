//
//  ViewController.m
//  dzsgz
//
//  Created by wfnji on 2019/1/4.
//  Copyright © 2019年 tencentload. All rights reserved.
//

#import "ViewController.h"
#import "wertyuProgressView.h"
#import "EgretWebViewLib.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)wertyuProgressView *  pro;
@property (nonatomic,strong)NSTimer * timer;
@property (nonatomic,assign)CGFloat top;
@property (nonatomic,copy)NSString * gameUrl;
@property (nonatomic,strong)NSString * frameWH;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* bg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"jpg"]];
    UIImageView* imageview = [[UIImageView alloc] initWithImage:bg];
    
    [imageview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:imageview];
    self.imageview=imageview;
    
    [EgretWebViewLib initialize:@"/egretGame/preload/"];
    
    if([self getStatusH] >22){
        self.top=[self getStatusH];
        self.frameWH =[NSString stringWithFormat:@"%f:34",self.top];
        
        [[UIApplication  sharedApplication]setStatusBarHidden:YES];
    }else{
        self.top=0;
        self.frameWH =[NSString stringWithFormat:@"%f:0",self.top];
        [[UIApplication  sharedApplication]setStatusBarHidden:YES];
    }
    
    __weak __typeof__(self) weakSelf = self;
    
    // [EgretWebViewLib callExternalInterface:@"frame" Value:]
    //加载完成
    [EgretWebViewLib setExternalInterface:@"doCancelLoading" Callback:^(NSString * we) {
       
        [weakSelf hideLoadView];
        //weakSelf.imageview.hidden =YES;
    }];
    
    //数据上传
    [EgretWebViewLib setExternalInterface:@"doSpot" Callback:^(NSString * jsonDic) {
        
        NSDictionary * dic = [weakSelf dictionaryWithStringUpdate:jsonDic];
        if([[NSString stringWithFormat:@"%@",[dic objectForKey:@"spotType"]]  isEqualToString:@"1"]){
 
            [wfnjiPlat wfnjicreateTheRoleOrCompleteNewbieGuide:selectStyleCreateTheRole];
        }else  if([[NSString stringWithFormat:@"%@",[dic objectForKey:@"spotType"]] isEqualToString:@"2"]){
 
            [wfnjiPlat wfnjicreateTheRoleOrCompleteNewbieGuide:selectStyleCompleteNewbieGuide];
        }else  if([[NSString stringWithFormat:@"%@",[dic objectForKey:@"spotType"]] isEqualToString:@"3"]){
            NSDictionary * info = [dic objectForKey:@"extra"];
    
            [wfnjiPlat wfnjiRoleName:[info objectForKey:@"roleName"] gameLevel:[info objectForKey:@"roleLevel"] serverID:[info objectForKey:@"roleServer"] status:@"3"];
        }
        
    }];
    
    [EgretWebViewLib setExternalInterface:@"doRecreate" Callback:^(NSString * we) {
    
        [EgretWebViewLib stopAllLoader];
        [EgretWebViewLib stopGame];
        [wfnjiPlat logout];
    }];
    
    [EgretWebViewLib setExternalInterface:@"doLoadZip" Callback:^(NSString * we) {
   
    }];
    
    //支付
    [EgretWebViewLib setExternalInterface:@"doGooglePay" Callback:^(NSString * message) {
        NSDictionary * dic = [weakSelf dictionaryWithString:message];
        //        {"appId":"1637","productId":1001,"productName":"60元寶","price":0.99,"extra":"wfnji88ios_999_999_26312_26736","sign":"E15BD49455FC5DDC6FEE582B606D9BCF","payStage":1001}
 
        [weakSelf payID:@"ugliest" payName: [NSString stringWithFormat:@"%@",[dic objectForKey:@"productName"]] gameReceipts:[NSString stringWithFormat:@"%@" ,[dic objectForKey:@"extra"]] payPrice:[NSString stringWithFormat:@"%@",[dic objectForKey:@"price"]]];
    }];
  
    [EgretWebViewLib setExternalInterface:@"doReady" Callback:^(NSString * we) {
       
        [EgretWebViewLib callExternalInterface:@"doResize" Value:self.frameWH];
    }];
}


- (void)viewDidAppear:(BOOL)animated{
    [wfnjiPlat login:self];
}
- (void)countDownTime{
    if(self.pro.progress>=1){}else{
        self.pro .progress += 0.01;}
}
//支付测试
-(void)payID:(NSString * )payID payName:(NSString * )payName gameReceipts:(NSString *)receipts payPrice:(NSString *)price
{   [wfnjiPlat setLoadingOn];
    NSLog(@"当前接口名字混淆后的%s",__FUNCTION__);
    OrderModel* mPayInfo = [[OrderModel alloc] init];
    /** 商品id */
    mPayInfo.productID=payID;
    /** Y 商品名 */
    mPayInfo.productName=payName;
    /** Y 商品价格 */
    mPayInfo.productPrice=price;
    /** 商品描述（不传则使用productName） */
    mPayInfo.productDes=payName;
    /** 游戏传入的有关用户的区id，服务器id，角色id,订单等，属于透传数据功能 */
    mPayInfo.gameReceipts=receipts;
    /** Y 游戏角色id */
    mPayInfo.roleID=@"";
    /** Y 游戏角色名 */
    mPayInfo.roleName=@"";
    /** 游戏角色等级 */
    mPayInfo.roleLevel=@"";
    /** Y Vip等级 */
    mPayInfo.vipLevel=@"";
    /** Y 帮派、公会等 */
    mPayInfo.partyName=@"";
    /** Y 服务器id，若无填“1” */
    mPayInfo.zoneID=@"";
    /** Y 服务器名 */
    mPayInfo.zoneName=@"";
    /** N 扩展字段 */
    mPayInfo.text=@"";
    /**
     回调地址 可传可不传，不传使用默认
     */
    // mPayInfo.wfnjinotifyURL = @"http://demo.wfnji88.com/ok.php?gameid=1156&promote=2";
    
    [wfnjiPlat wfnjipay:mPayInfo CallBack:self];
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

//回调-(void)onFinish:(wfnjiStatus)code Desc:(NSString*)desc Data:(NSObject*)Data;
-(void)onFinish:(wfnjiStatus)code   Data:(NSDictionary*)Data
{
    NSLog(@"回调状态值：%ld",(long)code);
    
    
    NSLog(@"回调：%@",Data);
    if(code==LOGIN_SUCCESS){
        self.gameUrl= [Data objectForKey:@"gameUrl"];
        
        [self showLoadingBg];
        [EgretWebViewLib startGame:self.gameUrl  SuperView:self.view];
    }
    else if(code== LOGOUT_SUCCESS){
        self.pro.alpha=0;
        self.pro.progress=0;
        
        
        [self login];
    }else if(code== LOGIN_SWITCH){
        self.pro.alpha=0;
        self.pro.progress=0;
        
        
        [self login];
    } else if (code ==PAY_SUCCESS){
        // [self setPromot:@"支付成功"];
    } else if (code== PAY_FAILED){
        [self setPromot:@"支付失败"];
    }else if (code==PAY_CANCEL){
        [self setPromot:@"支付取消"];
    }else if (code==PAY_UNKNOWN){
        [self setPromot:@"支付未知"];
    }
}


- (NSDictionary *)dictionaryWithString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
- (NSDictionary *)dictionaryWithStringUpdate:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@"\"{" withString:@"{" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"}\"" withString:@"}" options:NSLiteralSearch range:range2];
    
    NSRange range3 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\\" withString:@"" options:NSLiteralSearch range:range3];
    
    NSLog(@"%@",mutStr);
    NSData *jsonData = [mutStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}


- (CGFloat)getStatusH{
    CGFloat h =0;
    // 状态栏(statusbar)
    
    CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
    
    //    //标题栏
    //
    //    CGRect NavRect = self.navigationController.navigationBar.frame;
    
    h= StatusRect.size.height;//+NavRect.size.height;
    
    return h;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)login{
    [wfnjiPlat login:self];
}

- (void)showLoadingBg{
    UIWindow  * window = [UIApplication sharedApplication].keyWindow;
    UIView    * bgView = [[UIView alloc]initWithFrame:window.frame];
    bgView.tag =1000;
  
    [window  addSubview:bgView];
    UIImage* bg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"jpg"]];
    UIImageView* imageview = [[UIImageView alloc] initWithImage:bg];
    imageview .frame =bgView.frame;
    imageview.tag =1001;
    [bgView addSubview:imageview];
    //进度条
    wertyuProgressView *progressView = [[wertyuProgressView alloc] initWithFrame:CGRectMake((bgView.frame.size.width-280)/2.0, bgView.frame.size.height-148,  280, 18)];
    //进度条边框宽度
    progressView.progerStokeWidth=1.0f;
    //进度条未加载背景
    progressView.progerssBackgroundColor=[UIColor colorWithRed:5/255.0 green:5/255.0 blue:3/255.0 alpha:1];
    //进度条已加载 颜色
    progressView.progerssColor=[UIColor colorWithRed:150/255.0 green:83/255.0 blue:75/255.0 alpha:1];
    //背景边框颜色
    progressView.progerssStokeBackgroundColor=[UIColor clearColor];
    [bgView addSubview:progressView];
    self.pro = progressView;
    self.pro.alpha=0;
    self.timer = [NSTimer timerWithTimeInterval:0.2 target: self selector:@selector(countDownTime) userInfo:nil repeats:YES];
    // 必须设置 NSRunLoop 线程池，否则无效
    self.pro.alpha=1;
    self.pro.progress=0;
    [self.timer fire];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    UILabel * titlelab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pro.frame)+30, bgView.frame.size.width, 18)];
    titlelab.textColor =[UIColor whiteColor];
    titlelab.text =[wfnjiPlat  setlaugulgString:@"wfnji_loading_tips"];
    titlelab.font = [UIFont boldSystemFontOfSize:14];
    titlelab.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:titlelab];
}
- (void)hideLoadView {
    UIWindow  * window = [UIApplication sharedApplication].keyWindow;
    UIView * bg = [window viewWithTag:1000];
    [bg removeFromSuperview];
    UIImageView * image= [window viewWithTag:1001];
    [image removeFromSuperview];
    
}
- (void)setPromot:(NSString *)strPro{
    UIAlertView * ale = [[UIAlertView alloc]initWithTitle:@"提示" message:strPro delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [ale show];
}

@end
