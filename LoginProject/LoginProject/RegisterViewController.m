//
//  RegisterViewController.m
//  LoginProject
//
//  Created by Brfs on 2019/11/25.
//  Copyright © 2019 GameChild. All rights reserved.
//

#import "RegisterViewController.h"
#import "Masonry/Masonry.h"
#import "LoginViewController.h"
#import "GameHelper.h"
#import "constants.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, deviceWidth - 80, 350)];
    mainView.backgroundColor = [UIColor whiteColor];
    
    mainView.layer.shadowOffset = CGSizeMake(0, 0);
    mainView.layer.shadowColor = [[UIColor grayColor] CGColor];
    mainView.layer.shadowOpacity = 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -2, deviceWidth - 80 + 4, 350 + 4)];
    mainView.layer.shadowPath = path.CGPath;
    [self.view addSubview:mainView];
    
    UILabel *mainViewTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    mainViewTitle.text = @"手机注册";
    mainViewTitle.textColor = [UIColor blackColor];
    mainViewTitle.font = [UIFont systemFontOfSize:20.0];
    mainViewTitle.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:mainViewTitle];
    
    UITextField *account = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    account.placeholder = @"请输入手机号码";
    account.font = [UIFont systemFontOfSize:16.0];
    account.borderStyle = UITextBorderStyleNone;
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,account.frame.size.height-2, account.frame.size.width, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [account addSubview:line];
    [mainView addSubview:account];
    
    
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    password.placeholder = @"密码(6-20位)";
    password.secureTextEntry = YES;
    password.font = [UIFont systemFontOfSize:16.0];
    password.borderStyle = UITextBorderStyleNone;
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(0,password.frame.size.height-2, password.frame.size.width, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [password addSubview:line1];
    [mainView addSubview:password];
    
    
    UITextField *verifty = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    verifty.placeholder = @"请输入验证码";
    verifty.font = [UIFont systemFontOfSize:16.0];
    verifty.borderStyle = UITextBorderStyleNone;
    UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(0,verifty.frame.size.height-2, verifty.frame.size.width, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [verifty addSubview:line2];
    [mainView addSubview:verifty];
    
    UIButton *request = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100,40)];
    
    [request setTitle:@"获取二维码" forState:UIControlStateNormal];
    request.backgroundColor = [UIColor colorWithRed:253/255.0 green:177/255.0 blue:87/255.0 alpha:1];
    [request addTarget:self action:@selector(getVerity:) forControlEvents:UIControlEventTouchUpInside];
    verifty.rightView = request;
    verifty.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *startGame = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width - 40, 40)];
    [startGame setTitle:@"完成注册" forState:UIControlStateNormal];
    startGame.backgroundColor = [UIColor colorWithRed:253/255.0 green:177/255.0 blue:87/255.0 alpha:1];
    [startGame addTarget:self action:@selector(DoneRegister:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:startGame];
    
    UIButton *phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    phoneButton.backgroundColor = [UIColor clearColor];
    phoneButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [phoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [phoneButton setTitle:@"返回登录 >" forState:UIControlStateNormal];
    [phoneButton addTarget:self action:@selector(BackClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //[mainView addSubview:regiButton];
    [mainView addSubview:phoneButton];
    
    
    [phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(mainView).offset(-19);
        make.top.equalTo(startGame).offset(50);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [startGame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(verifty).offset(70);
        make.size.mas_equalTo(CGSizeMake(mainView.frame.size.width - 40, 40));
    }];
    [verifty mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(20);
        make.top.equalTo(password).offset(60);
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
            make.top.equalTo(self.view).offset(self.textitle.frame.size.height + NavHeight + 130);
        }else{
            make.top.equalTo(self.view).offset(self.textitle.frame.size.height + NavHeight + 200);
        }
        make.size.mas_equalTo(CGSizeMake(deviceWidth - 80, 350));
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

- (void)QQCilck:(UIButton *)sender{
    NSLog(@"QQCilck");
}
- (void)WeChatCilck:(UIButton *)sender{
    NSLog(@"WeChatCilck");
}
- (void)WeiBoCilck:(UIButton *)sender{
    NSLog(@"WeiBoCilck");
}
//完成按钮点击事件
- (void)DoneRegister:(UIButton *)sender{
    NSLog(@"DoneRegister");
}
//返回登录点击事件
- (void)BackClick:(UIButton *)sender{
    NSLog(@"BackClick");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//获取二维码点击事件
- (void)getVerity:(UIButton *)sender{
    NSLog(@"getVerity");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
