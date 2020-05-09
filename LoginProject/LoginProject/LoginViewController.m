//
//  ViewController.m
//  LoginProject
//
//  Created by Brfs on 2019/11/25.
//  Copyright © 2019 GameChild. All rights reserved.
//

#import "LoginViewController.h"
#import "GameHelper.h"
#import "constants.h"
#import "Masonry/Masonry.h"
#import "PhoneViewController.h"
#import "RegisterViewController.h"
#import "YLImageView.h"
#import "YLGIFImage.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
}
- (void)setBackGround{
    UIImageView *background = [[UIImageView alloc] initWithImage:[GameHelper imageFromBundle:@"" imgName:@"background"]];
    [background setFrame:CGRectMake(0, 0, deviceWidth, deviceHeight)];
    [self.view addSubview:background];
    UILabel *textitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.textitle = textitle;
    self.textitle.text = @"Title";
    self.textitle.font = [UIFont systemFontOfSize:34.0];
    self.textitle.textAlignment = NSTextAlignmentCenter;
    self.textitle.textColor = [UIColor whiteColor];
    [self.view addSubview:self.textitle];
    [self.textitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(NavHeight + 20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
}
- (void)setupUI{
    [self setBackGround];
    [self foooterLogin];
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, deviceWidth - 80, 300)];
    mainView.backgroundColor = [UIColor whiteColor];
    
    mainView.layer.shadowOffset = CGSizeMake(0, 0);
    mainView.layer.shadowColor = [[UIColor grayColor] CGColor];
    mainView.layer.shadowOpacity = 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -2, deviceWidth - 80 + 4, 300 + 4)];
    mainView.layer.shadowPath = path.CGPath;
    [self.view addSubview:mainView];
    
    UILabel *mainViewTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    mainViewTitle.text = @"登录";
    mainViewTitle.textColor = [UIColor blackColor];
    mainViewTitle.font = [UIFont systemFontOfSize:20.0];
    mainViewTitle.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:mainViewTitle];
    
    UITextField *account = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    account.placeholder = @"请输入用户名";
    account.font = [UIFont systemFontOfSize:16.0];
    account.borderStyle = UITextBorderStyleNone;
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,account.frame.size.height-2, account.frame.size.width, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [account addSubview:line];
    [mainView addSubview:account];
    
    
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    password.placeholder = @"请输入密码";
    password.secureTextEntry = YES;
    password.font = [UIFont systemFontOfSize:16.0];
    password.borderStyle = UITextBorderStyleNone;
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(0,password.frame.size.height-2, password.frame.size.width, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [password addSubview:line1];
    [mainView addSubview:password];
    
    UIButton *forget = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 90, 20)];
    forget.backgroundColor = [UIColor clearColor];
    [forget setTitle:@"忘记账号/密码？" forState:UIControlStateNormal];
    forget.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [forget setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [forget addTarget:self action:@selector(forgetEvent:) forControlEvents:UIControlEventTouchUpInside];
    password.rightView = forget;
    password.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *startGame = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    [startGame setTitle:@"进入游戏" forState:UIControlStateNormal];
    startGame.backgroundColor = [UIColor colorWithRed:253/255.0 green:177/255.0 blue:87/255.0 alpha:1];
    [startGame addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:startGame];
    
    UIButton *regiButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    regiButton.backgroundColor = [UIColor clearColor];
    regiButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [regiButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [regiButton setTitle:@"一键注册" forState:UIControlStateNormal];
    [regiButton addTarget:self action:@selector(regisert:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    phoneButton.backgroundColor = [UIColor clearColor];
    phoneButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [phoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [phoneButton setTitle:@"手机注册" forState:UIControlStateNormal];
    [phoneButton addTarget:self action:@selector(phoneReightsert:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [mainView addSubview:regiButton];
    [mainView addSubview:phoneButton];
    
    
    [phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(mainView).offset(-19);
        make.top.equalTo(startGame).offset(50);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    [regiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(startGame).offset(50);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    [startGame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(password).offset(70);
        make.size.mas_equalTo(CGSizeMake(mainView.frame.size.width - 40, 40));
    }];
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(account).offset(60);
        make.size.mas_equalTo(CGSizeMake(mainView.frame.size.width - 40, 40));
    }];
    [account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(mainViewTitle).offset(50);
        make.size.mas_equalTo(CGSizeMake(mainView.frame.size.width - 40, 40));
    }];
    [mainViewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(mainView);
        make.top.equalTo(mainView).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        if (kiPhone6 || kiPhone5){
            make.top.equalTo(self.view).offset(self.textitle.frame.size.height + NavHeight + 150);
        }else{
            make.top.equalTo(self.view).offset(self.textitle.frame.size.height + NavHeight + 220);
        }
        make.size.mas_equalTo(CGSizeMake(deviceWidth - 80, 300));
    }];
}
- (void)foooterLogin{
    UIButton *WeChat = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [WeChat setImage:[GameHelper imageFromBundle:@"" imgName:@"WeChat"] forState:UIControlStateNormal];
    [WeChat addTarget:self action:@selector(WeChatCilck:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *QQ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [QQ setImage:[GameHelper imageFromBundle:@"" imgName:@"QQ"] forState:UIControlStateNormal];
    [QQ addTarget:self action:@selector(QQCilck:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *WeiBo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [WeiBo setImage:[GameHelper imageFromBundle:@"" imgName:@"WeiBo"] forState:UIControlStateNormal];
    [WeiBo addTarget:self action:@selector(WeiBoCilck:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:WeChat];
    [self.view addSubview:QQ];
    [self.view addSubview:WeiBo];
    
    [WeChat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-(NavHeight));
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-(NavHeight));
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [WeiBo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(-100);
        make.bottom.equalTo(self.view).offset(-(NavHeight));
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

- (void)forgetEvent:(UIButton *)sender{
    NSLog(@"忘记密码");
}
- (void)phoneReightsert:(UIButton *)sender{
    NSLog(@"手机注册");
    [self presentViewController:[PhoneViewController new] animated:YES completion:nil];
}
- (void)regisert:(UIButton *)sender{
    NSLog(@"一键注册");
    [self presentViewController:[RegisterViewController new] animated:YES completion:nil];
}
- (void)startGame:(UIButton *)sender{
    NSLog(@"开始游戏");
}

- (void)QQCilck:(UIButton *)sender{
    NSLog(@"QQCilck");
}
- (void)WeChatCilck:(UIButton *)sender{
    NSLog(@"WeChatCilck");
}
- (void)WeiBoCilck:(UIButton *)sender{
    NSLog(@"WeiBoCilck");
}
- (void)canl:(UIButton *)sender{
    NSLog(@"弹窗");
}

//自定义弹窗效果
-(void)popupUI{
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.frame = self.view.frame;
    backgroundView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];
    [self.view addSubview:backgroundView];
    
    UIView *popupView = [[UIView alloc] init];
    popupView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 150, CGRectGetMidY(self.view.frame)/2 + 100, 300, 200);
    popupView.backgroundColor = [UIColor whiteColor];
    popupView.layer.cornerRadius = 15;
    [self.view addSubview:popupView];
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(CGRectGetMinX(popupView.bounds), CGRectGetMaxY(popupView.bounds) - 50, CGRectGetWidth(popupView.bounds), 0.8);
    line.backgroundColor = [UIColor lightGrayColor];
    line.alpha = 0.8;
    [popupView addSubview:line];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(CGRectGetMinX(popupView.bounds), CGRectGetMaxY(popupView.bounds) - 40, CGRectGetWidth(popupView.bounds) ,30);
    [button setTitle:@"切换账号" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button addTarget:self action:@selector(canl:) forControlEvents:UIControlEventTouchUpInside];
    [popupView addSubview:button];
    
    YLImageView* imageView = [[YLImageView alloc] init];
    imageView.frame = CGRectMake(CGRectGetMidX(popupView.bounds) - 50, CGRectGetMinY(popupView.bounds), 100 ,100);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = [YLGIFImage imageNamed:@"loading.gif"];
    [popupView addSubview:imageView];
    
    UILabel *welcomeId = [[UILabel alloc] init];
    welcomeId.text = [NSString stringWithFormat:@"%@",@"840062,欢迎回来"];
    welcomeId.font = [UIFont systemFontOfSize:17];
    welcomeId.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:77/255.0 alpha:1];
    welcomeId.frame = CGRectMake(CGRectGetMinX(popupView.bounds), CGRectGetMaxY(imageView.frame), CGRectGetWidth(popupView.bounds) ,30);
    welcomeId.textAlignment = 1;
    [popupView addSubview:welcomeId];
    
}


@end
