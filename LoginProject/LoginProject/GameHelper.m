//
//  gameHelper.m
//  DCGame
//
//  Created by wangyuan on 2019/11/19.
//  Copyright © 2019 wangyuan. All rights reserved.
//

#import "GameHelper.h"
#import <sys/sysctl.h>
#import <sys/socket.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <AdSupport/AdSupport.h>
#import <arpa/inet.h>
#import <sys/utsname.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CommonCrypto/CommonCrypto.h>
#import <WebKit/WebKit.h>
#import "constants.h"
#import "MBProgressHUD/MBProgressHUD.h"

@implementation GameHelper

+ (NSString *)getTimeStamp
{
    double time = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *timeStr = [NSString stringWithFormat:@"%f",time];
    NSRange range = [timeStr rangeOfString:@"."];
    NSString *timeStamp = [timeStr substringToIndex:range.location];
    return timeStamp;
}

+ (NSString *)timeInterval
{
    NSDate * new = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString * timeSp = [NSString stringWithFormat:@"%ld", (long)[new timeIntervalSince1970] * 1];
    
    return timeSp;
}

+ (void)UserAgent
{
    WKWebViewConfiguration* webViewConfig = [WKWebViewConfiguration new];
    webViewConfig.allowsInlineMediaPlayback = YES;
    WKWebView *vk = [[WKWebView alloc] initWithFrame:CGRectZero configuration:webViewConfig];
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:vk];
    
    [vk evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError *error) {
        NSString* secretAgent = result;
        NSLog(@"secretAgent :%@", secretAgent);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *str = [defaults objectForKey:@"userAgent"];
            if (!str) {
                [defaults setObject:secretAgent forKey:@"userAgent"];
                [defaults synchronize];
            }
        });
    }];
}

+ (NSString *)deviceType
{
    NSString *deviceType = [self iphoneType];
    
    return deviceType;
}

+ (NSString*)iphoneType {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"])
        
        return@"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"])
        
        return@"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"])
        
        return@"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"])
        
        return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"])
        
        return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"])
        
        return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"])
        
        return@"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"])
        
        return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"])
        
        return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"])
        
        return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"])
        
        return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"])
        
        return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"])
        
        return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"])
        
        return@"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"])
        
        return@"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"])
        
        return@"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"])
        
        return@"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"])
        
        return@"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"])
        
        return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"])
        
        return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"])
        
        return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"])
        
        return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"])
        return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"])
        return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"])
        return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"])
        return@"iPhone X";
    
    if([platform isEqualToString:@"iPod1,1"])
        return@"iPod Touch 1G";
    
    if([platform isEqualToString:@"iPod2,1"])
        return@"iPod Touch 2G";
    
    if([platform isEqualToString:@"iPod3,1"])
        return@"iPod Touch 3G";
    
    if([platform isEqualToString:@"iPod4,1"])
        return@"iPod Touch 4G";
    
    if([platform isEqualToString:@"iPod5,1"])
        return@"iPod Touch 5G";
    
    if([platform isEqualToString:@"iPad1,1"])
        return@"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"])
        return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"])
        return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"])
        return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"])
        return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"])
        return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"])
        return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"])
        return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"])
        return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"])
        return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"])
        return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"])
        return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"])
        return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"])
        return@"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"])
        return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"])
        return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"])
        return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"])
        return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"])
        return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,6"])
        return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"])
        return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"])
        return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"])
        return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"])
        return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"])
        return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"])
        return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"])
        return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"])
        return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"])
        return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"])
        return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"])
        return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"i386"])
        return@"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"])
        return@"iPhone Simulator";
    
    return platform;
}

+ (NSString *)systemVersion
{
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    
    return systemVersion;
}

+ (NSString *)systemLanguages
{
    NSArray *systemLanguages = [NSLocale preferredLanguages];
    return [systemLanguages objectAtIndex:0];
}

+ (NSString *)MacAddress
{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        free(buf);
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    // MAC地址带冒号
    // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2),
    // *(ptr+3), *(ptr+4), *(ptr+5)];
    
    // MAC地址不带冒号
    NSString *outstring = [NSString
                           stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr + 1), *(ptr + 2), *(ptr + 3), *(ptr + 4), *(ptr + 5)];
    
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *)imsiString
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    NSString *mcc = [carrier mobileCountryCode];
    NSString *mnc = [carrier mobileNetworkCode];
    
    NSString *imsi = [NSString stringWithFormat:@"%@%@", mcc, mnc];
    
    if (([mcc isEqual:[NSNull null]]&&[mnc isEqual:[NSNull null]])||(mcc.length == 0&&mnc.length==0)) {
        
        imsi = @"null";
        
    }
    
    return imsi;
}

+ (NSString *)getOperator
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    //当前手机所属运营商名称
    
    NSString *mobile;
    
    //先判断有没有SIM卡，如果没有则不获取本机运营商
    
    if (!carrier.isoCountryCode) {
        
        NSLog(@"没有SIM卡");
        
        mobile = @"无运营商";
        
    }else{
        
        mobile = [carrier carrierName];
        
    }
    
    return [NSString stringWithFormat:@"%@",mobile];
}

+ (NSString *)iphoneIdfa
{
    NSString *idfa = @"";
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        if ([ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled) {
            idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        }
        else
        {
            idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        }
        
    }
    return idfa;
}

+(NSString *)IDv
{
    NSString *idfv = @"";
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        
        idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
    }
    
    return idfv;
}

#pragma mark - 字典转字符串

+(NSString *)DicToString:(NSDictionary *)dict{
    
    NSError * error = nil;
    NSData * dictData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        return @"";
    }
    
    NSString * jsonString = [[NSString alloc] initWithData:dictData encoding:NSUTF8StringEncoding];
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return jsonString;
}

#pragma mark - URLEncode

+(NSString *)urlEncode:(NSString *)rawString{
    
    //    NSMutableString *encoded = [[rawString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    
    NSMutableString * encoded = [[rawString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] mutableCopy];
    [encoded replaceOccurrencesOfString:@"$" withString:@"%24" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"&" withString:@"%26" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"+" withString:@"%2B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"," withString:@"%2C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"/" withString:@"%2F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@":" withString:@"%3A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@";" withString:@"%3B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"=" withString:@"%3D" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"?" withString:@"%3F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"@" withString:@"%40" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"\t" withString:@"%09" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"#" withString:@"%23" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"<" withString:@"%3C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@">" withString:@"%3E" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"\"" withString:@"%22" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    [encoded replaceOccurrencesOfString:@"\n" withString:@"%0A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [encoded length])];
    return encoded;
}


//成功提示
+(void)showSuccess:(NSString *)msg
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hub.detailsLabelText = msg;
    hub.userInteractionEnabled = NO;
    
    //设置成功的图片
    hub.customView = [[UIImageView alloc] initWithImage:[self imageFromBundle:@"" imgName:@"success"]];
    
    //设置模式
    hub.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hub.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hub hide:YES afterDelay:1.8];
    
}

//错误提示
+(void)showError:(NSString *)msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.detailsLabelText = msg;
    hud.userInteractionEnabled = NO;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[self imageFromBundle:@"" imgName:@"error"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:2];
}

//从bundle文件里获取图片
+(UIImage *)imageFromBundle:(NSString *)folderName imgName:(NSString *)imgName
{
    if(folderName && [folderName length] > 0){
        
        NSString * file_path = [BUNDLEPATH stringByAppendingPathComponent:folderName];
        
        NSString * img_path = [file_path stringByAppendingPathComponent:imgName];
        
        return [UIImage imageWithContentsOfFile:img_path];
    }
    
    NSString * img_path = [BUNDLEPATH stringByAppendingPathComponent:imgName];
    
    return [UIImage imageWithContentsOfFile:img_path];
}


+ (NSString *)MD5:(NSString *)sourceString
{
    const char * cString = [sourceString UTF8String];
    unsigned char result[16];
    CC_MD5(cString, (CC_LONG)strlen((const char *)cString), result);
    NSString *sign= [NSString stringWithFormat:
                     @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                     result[0], result[1], result[2], result[3],
                     result[4], result[5], result[6], result[7],
                     result[8], result[9], result[10], result[11],
                     result[12], result[13], result[14], result[15]
                     ];
    return [sign lowercaseString];
}


#pragma mark - 颜色生成图片

+(UIImage *)imageWithColor:(UIColor *)color{
    
    // 描述矩形
    CGRect rect=CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
    
}

#pragma mark - 验证手机号是否合法

+ (BOOL)validatePhone:(NSString *)phoneNumber{
    
    if (phoneNumber == nil || phoneNumber.length == 0){
        
        return NO;
    }
    
    NSString * phone = @"^1[3456789]\\d{9}$";
    
    NSPredicate * predicateMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phone];
    
    if ([predicateMobile evaluateWithObject:phoneNumber]){
        
        return YES;
        
    }else{
        
        return NO;
    }
}

#pragma mark - 根据时间戳获取距离现在的状态(刚刚,分钟前,今天,昨天)

+(NSString *)distanceTimeWithBeforeTime:(double)beTime{
    
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    
    double distanceTime = now - beTime;
    
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60) {//小于一分钟
        
        distanceStr = @"刚刚";
        
    }else if (distanceTime < 60 * 60) {//时间小于一个小时
        
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime / 60];
        
    }else if(distanceTime < 24 * 60 * 60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
        
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
        
    }else if(distanceTime < 24 * 60 * 60 * 2 && [nowDay integerValue] != [lastDay integerValue]){
        
        if ([nowDay integerValue] - [lastDay integerValue] == 1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
            
        }else{
            
            [df setDateFormat:@"MM-dd HH:mm"];
            
            distanceStr = [df stringFromDate:beDate];
        }
        
    }else if(distanceTime < 24 * 60 * 60 * 365){
        
        [df setDateFormat:@"MM-dd HH:mm"];
        
        distanceStr = [df stringFromDate:beDate];
        
    }else{
        
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        distanceStr = [df stringFromDate:beDate];
    }
    
    return distanceStr;
}
@end
