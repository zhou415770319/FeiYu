//
//  LoginViewController.m
//  FeiYu
//
//  Created by 周飞 on 2017/9/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "LoginViewController.h"
#import "ZFSelectMenuManager.h"
#import "WSLoginView.h"
@interface LoginViewController ()
@property (nonatomic, strong) SZFoldawayButton *szBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
    wsLoginV.titleLabel.text = @"login view";
    wsLoginV.titleLabel.textColor = [UIColor grayColor];
    wsLoginV.hideEyesType = AllEyesHide;//遮挡眼睛类型
    [self.view addSubview:wsLoginV];
    
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        NSLog(@"点击了登录按钮textField1 = %@   textField2 = %@",textField1Text,textField2Text);
        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"登录按钮事件" message:[NSString stringWithFormat:@"账号：%@\n密码：%@",textField1Text,textField2Text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertV show];
    }];
    
    
    self.szBtn = [ZFSelectMenuManager menuWithFrame:CGRectMake(SCREENWIDTH-40, 100, 40, 40) superView:self.view];
    
//    SZFoldawayModel *model = [[SZFoldawayModel alloc] initWithmMainBtnTitle:@"" selectTitle:@"" backColor:[UIColor blackColor] image:@"icon_tabbar_misc" selectImage:@""];
//    model.subBtnTitles = @[@"壹", @"贰", @"叁", @"肆", @"伍"];
//    model.subBtnColors = @[[UIColor purpleColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor lightGrayColor]];
//
//    self.szBtn = [[SZFoldawayButton alloc] initWithRect:CGRectMake(SCREENWIDTH-40, 100, 40, 40) andFoldAwayModel:model];
//    self.szBtn.showType = showTypeOfCircle;
//    self.szBtn.automaticShowDirection = YES;
//    self.szBtn.disperseDistance = 60;
//    [self.szBtn showInView:self.view];
//    self.szBtn.clickSubButtonBack = ^(int index, NSString *title, BOOL select){
//        NSLog(@"%zd -- %@ --  %zd", index, title, select);
//    };
    // Do any additional setup after loading the view.
}

-(void)btnClick:(UIButton *)sender{
    
    NSString *customURL = [NSString stringWithFormat:@"%@://Main",@"FeiYu-CocoaC"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
