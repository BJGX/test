//
//  ViewController.m
//  UMengLogin
//
//  Created by tembin on 2017/4/6.
//  Copyright © 2017年 YQ. All rights reserved.
//

#import "ViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()


@property (nonatomic, strong) UITextField *aa;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setUI];
  
  // Do any additional setup after loading the view, typically from a nib.
}


-(void)setUI{
    
    self.aa = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
  
  UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT / 2 + 70, WIDTH, 25)];
  tipLabel.textAlignment = NSTextAlignmentCenter;
  tipLabel.text = @"第三方登录";
  [self.view addSubview:tipLabel];
  
  UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(30, HEIGHT / 2  + 100, WIDTH - 60, 0.5)];
  lineView.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:lineView];
  NSArray *array = @[@"qq",@"微信",@"微博"];
  for (int i = 0; i < 3; i++) {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH / 3 * i + WIDTH / 3 / 2  - 25, HEIGHT / 2 + 125, 50, 50)];
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:array[i] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.tag = i + 100;
    [btn addTarget:self action:@selector(loginButton:) forControlEvents:UIControlEventTouchUpInside];
  }
}

-(void)loginButton:(UIButton *)sender {
  NSInteger index = sender.tag - 100;
  [self getAuthWithUserInfoFromSina];
  if (index == 1) {
//    [self getUserInfoForPlatform:UMSocialPlatformType_Sina];
    
  }
}



- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
  [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
    
    UMSocialUserInfoResponse *resp = result;

    NSLog(@" uid: %@", resp.uid);
    NSLog(@" openid: %@", resp.openid);
    NSLog(@" accessToken: %@", resp.accessToken);
    NSLog(@" refreshToken: %@", resp.refreshToken);
    NSLog(@" expiration: %@", resp.expiration);

    NSLog(@" name: %@", resp.name);
    NSLog(@" iconurl: %@", resp.iconurl);
    NSLog(@" gender: %@", resp.gender);
    NSLog(@" originalResponse: %@", resp.originalResponse);
  }];
}

- (void)getAuthWithUserInfoFromSina
{
  [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
    if (error) {
      NSLog(@"Sina error: %@", error);
    } else {
      UMSocialUserInfoResponse *resp = result;
      
      // 授权信息
      NSLog(@"Sina uid: %@", resp.uid);
      NSLog(@"Sina accessToken: %@", resp.accessToken);
      NSLog(@"Sina refreshToken: %@", resp.refreshToken);
      NSLog(@"Sina expiration: %@", resp.expiration);
      
      // 用户信息
      NSLog(@"Sina name: %@", resp.name);
      NSLog(@"Sina iconurl: %@", resp.iconurl);
      NSLog(@"Sina gender: %@", resp.gender);
      
      // 第三方平台SDK源数据
      NSLog(@"Sina originalResponse: %@", resp.originalResponse);
    }
  }];
  
  
//  - (void)getAuthWithUserInfoFromQQ
//  {
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
//      if (error) {
//        
//      } else {
//        UMSocialUserInfoResponse *resp = result;
//        
//        // 授权信息
//        NSLog(@"QQ uid: %@", resp.uid);
//        NSLog(@"QQ openid: %@", resp.openid);
//        NSLog(@"QQ accessToken: %@", resp.accessToken);
//        NSLog(@"QQ expiration: %@", resp.expiration);
//        
//        // 用户信息
//        NSLog(@"QQ name: %@", resp.name);
//        NSLog(@"QQ iconurl: %@", resp.iconurl);
//        NSLog(@"QQ gender: %@", resp.gender);
//        
//        // 第三方平台SDK源数据
//        NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//      }
//    }];
//  }
  
//  [[UMSocialManager defaultManager] authWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
//    if (error) {
//      NSLog(@"Sina error: %@", error);
//    } else {
//      UMSocialUserInfoResponse *resp = result;
//      
//      // 授权信息
//      NSLog(@"Sina uid: %@", resp.uid);
//      NSLog(@"Sina accessToken: %@", resp.accessToken);
//      NSLog(@"Sina refreshToken: %@", resp.refreshToken);
//      NSLog(@"Sina expiration: %@", resp.expiration);
//      
//      // 用户信息
//      NSLog(@"Sina name: %@", resp.name);
//      NSLog(@"Sina iconurl: %@", resp.iconurl);
//      NSLog(@"Sina gender: %@", resp.gender);
//      
//      // 第三方平台SDK源数据
//      NSLog(@"Sina originalResponse: %@", resp.originalResponse);
//    }
//  }];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
