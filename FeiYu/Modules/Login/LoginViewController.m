//
//  LoginViewController.m
//  FeiYu
//
//  Created by 周飞 on 2017/9/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"zhou" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 300, 30);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

-(void)btnClick:(UIButton *)sender{
    
    NSString *customURL = [NSString stringWithFormat:@"%@://Main",@"FeiYu-PreView"];
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
