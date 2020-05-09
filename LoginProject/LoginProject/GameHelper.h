//
//  gameHelper.h
//  DCGame
//
//  Created by wangyuan on 2019/11/19.
//  Copyright © 2019 wangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameHelper : NSObject

//获取时间戳
+ (NSString *)getTimeStamp;

+ (NSString *)timeInterval;

//获取浏览器信息
+ (void)UserAgent;

//获取设备型号
+ (NSString *)deviceType;

//设备系统版本号
+ (NSString *)systemVersion;

// 获取系统语言
+ (NSString *)systemLanguages;

///获取mac地址
+ (NSString *)MacAddress;

///获取手机Imsi
+ (NSString *)imsiString;

///获取运营商
+ (NSString *)getOperator;

+ (NSString *)iphoneIdfa;

+(NSString *)IDv;

#pragma 参数格式处理

///字典转字符串
+(NSString *)DicToString:(NSDictionary *)dict;

///URLEncode
+(NSString *)urlEncode:(NSString *)rawString;


#pragma 弹窗提示

//成功提示
+(void)showSuccess:(NSString *)msg;

//错误提示
+(void)showError:(NSString *)msg;


#pragma 从bundle文件里获取图片

+(UIImage *)imageFromBundle:(NSString *)folderName imgName:(NSString *)imgName;


#pragma MD5加密
+ (NSString *)MD5:(NSString *)sourceString;


///颜色生成图片
+(UIImage *)imageWithColor:(UIColor *)color;


///验证手机号是否合法
+ (BOOL)validatePhone:(NSString *)phoneNumber;


///根据时间戳获取距离现在的状态(刚刚,分钟前,今天,昨天)
+(NSString *)distanceTimeWithBeforeTime:(double)beTime;

@end

NS_ASSUME_NONNULL_END
