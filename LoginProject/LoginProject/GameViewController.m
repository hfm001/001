//
//  GameBaseViewController.m
//  DCGame
//
//  Created by wangyuan on 2019/11/20.
//  Copyright © 2019 wangyuan. All rights reserved.
//

#import "GameViewController.h"
#import "Masonry/Masonry.h"
#import "GameHelper.h"
#import "constants.h"

@interface GameViewController ()
@property(nonatomic,strong) UIImageView * bgView;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.mainView = [UIView new];
    self.mainView.contentMode = UIViewContentModeScaleToFill;
    self.mainView.backgroundColor = [UIColor blackColor];
    self.mainView.layer.cornerRadius = 5.0f;
    self.mainView.layer.masksToBounds = YES;
    //[self.mainView setFrame:CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    [self.view addSubview:self.mainView];
    
    ///添加模糊效果
    self.bgView = [UIImageView new];
    self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
    self.bgView.layer.cornerRadius = 5.0f;
    [self.mainView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
    }];
    
    self.logoImage = [UIImageView new];
    UIImage *bundleLogo = [GameHelper imageFromBundle:@"" imgName:@"logo"];
    self.logoImage.image = bundleLogo;
    [self.mainView addSubview:self.logoImage];
    
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mainView);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(bundleLogo.size.width / (iPhone? 1.7 : 1.5));
        make.height.mas_equalTo(bundleLogo.size.height / (iPhone ? 1.7 : 1.5));
    }];
    
    //返回按钮
    self.backBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBut setBackgroundImage:[GameHelper imageFromBundle:@"" imgName:@"back"] forState:UIControlStateNormal];
    [self.backBut addTarget:self action:@selector(backToView:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.backBut];
    
    [self.backBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(marginX);
        make.top.mas_equalTo(marginX);
        make.width.height.mas_equalTo(30);
    }];
    
    //title
    self.baseTitle = [UILabel new];
    self.baseTitle.textAlignment = NSTextAlignmentCenter;
    self.baseTitle.font = [UIFont systemFontOfSize:25];
    self.baseTitle.textColor = [UIColor blackColor];
    [self.mainView addSubview:self.baseTitle];
    
    [self.baseTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mainView);
        make.centerY.mas_equalTo(weakSelf.backBut);
        make.height.mas_equalTo(tfHeight);
    }];
}

- (void)backToView:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}

//展示界面title
- (void)showViewTitle:(NSString *)title
{
    //展示title
    self.baseTitle.text = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [self.logoImage removeFromSuperview];
}

//展示logo
- (void)showGameLogo
{
    [self.baseTitle removeFromSuperview];
    self.logoImage.hidden = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[self.mainView subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UITextField class]]) {
            [obj resignFirstResponder];
        }
    }];
}

-(void)dealloc{
    
    NSLog(@"%@ has dealloc",[self description]);
    
}
@end
