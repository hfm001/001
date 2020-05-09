//
//  GameBaseViewController.h
//  DCGame
//
//  Created by wangyuan on 2019/11/20.
//  Copyright © 2019 wangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEFAULTUA @"Mozilla/5.0 (iPhone; CPU iPhone OS 11_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E302"

///登录成功通知
#define DIDFINISHLOGIN    @"DIDFINISHLOGIN"

///注册成功通知
#define DIDFINISHREGISTER    @"DIDFINISHREGISTER"

///购买成功通知
#define DIDFINISHPURCHASE    @"DIDFINISHPURCHASE"

///购买失败通知
#define DIDFAILREGISTER    @"DIDFAILREGISTER"

///登出成功通知
#define DIDFINISHLOGOUT    @"DIDFINISHLOGOUT"

///快速注册成功
#define FASTRES    @"FASTRES"

#define chanleNumber @"Chanle_numberString"
#define ChanlIdentfierstring @"Chanl_ChanlIdentfier"


///bundle路径
#define BUNDLEPATH [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"image.bundle"]

///展示hud
#define ShowHUD   [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES]

///隐藏hud
#define HideHUD   [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES]



///设备宽度
#define  deviceWidth  [[UIScreen mainScreen] bounds].size.width

///设备高度
#define  deviceHeight  [[UIScreen mainScreen] bounds].size.height

///判断设备是否iPhone
#define isIphone   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

///判断设备是否iPad
#define isIPad   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

///判断设备是否iPhone
#define iPhone   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

///判断设备是否iPad
#define iPad   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


///元素之间的间距
#define marginX   (MIN(deviceWidth,deviceHeight) > 414 ? 17 : MIN(deviceWidth,deviceHeight) > 375 ? 15 : MIN(deviceWidth,deviceHeight) > 320 ? 13 : 10)

///子视图与父视图边界间距
#define BaseMargin   (MIN(deviceWidth,deviceHeight) > 414 ? 45 : MIN(deviceWidth,deviceHeight) > 375 ? 40 : MIN(deviceWidth,deviceHeight) > 320 ? 35 : 30)


//标题大小
#define titleFont (MIN(deviceWidth,deviceHeight) > 414 ? [UIFont fontWithName:@"Verdana" size:18] : MIN(deviceWidth,deviceHeight) > 375 ? [UIFont fontWithName:@"Verdana" size:17] : MIN(deviceWidth,deviceHeight) > 320 ? [UIFont fontWithName:@"Verdana" size:16] : [UIFont fontWithName:@"Verdana" size:15])

//文本框宽度

#define tfWidth   (MIN(deviceWidth,deviceHeight) > 414 ? 290 : MIN(deviceWidth,deviceHeight) > 375 ? 280 : MIN(deviceWidth,deviceHeight) > 320 ? 260 : 230)

//文本框高度
#define tfHeight (MIN(deviceWidth,deviceHeight) > 414 ? 46 : MIN(deviceWidth,deviceHeight) > 375 ? 44 : MIN(deviceWidth,deviceHeight) > 320 ? 44 : 40)

typedef NS_ENUM(NSInteger, codeType){
    
    CODE_register = 1,
    CODE_login = 2,
    CODE_changePWD = 3,
    FengQi_changeInfo = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface GameViewController : UIViewController

//主容器视图
@property(nonatomic,strong)UIView *mainView;

//logo
@property(nonatomic,strong)UIImageView *logoImage;

//标题
@property(nonatomic,strong)UILabel *baseTitle;

//返回箭头按钮
@property(nonatomic,strong)UIButton *backBut;

//展示界面title
- (void)showViewTitle:(NSString *)title;

//展示logo
- (void)showGameLogo;

@end

NS_ASSUME_NONNULL_END
