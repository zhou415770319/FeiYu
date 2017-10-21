//
//  BaseViewController.m
//  YMF
//
//  Created by Mac on 16/9/6.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "BaseViewController.h"
#import "BundleImage.h"
//#import "MainViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _progressHUD=[[SDProgressHUD alloc] initWithView:self.view];
    [self.view addSubview: _progressHUD];
    [self.view bringSubviewToFront:_progressHUD];
    _progressHUD.labelText= nil;

    // Do any additional setup after loading the view.
}

//-(void)setIsHidenTabBar:(BOOL)isHidenTabBar{
//    
//    if (_isHidenTabBar != isHidenTabBar) {
//        _isHidenTabBar = isHidenTabBar;
//        if ([self.tabBarController isKindOfClass:[MainViewController class]]) {
//            MainViewController *VC = (MainViewController *)self.tabBarController;
//            VC.tabBar.hidden = isHidenTabBar;
//        }
//    }
//    
//}




/**
 *  设置navigation标题
 *
 *  @param title 标题
 */
//- (void)setNavigationTitle:(NSString *)title{
//    
//    self.navigationController.navigationBar.tintColor = COLOR_NAV;
//    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, NAVIGATION_HEIGHT)];
//    titleView.backgroundColor = [UIColor clearColor];
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
//    titleLabel.text = title;
//    titleLabel.font = [UIFont systemFontOfSize:18.0f];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    [titleView addSubview:titleLabel];
//    
//    UILabel *miniLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 150, 10)];
//    miniLabel.font = [UIFont systemFontOfSize:11.0f];
//    miniLabel.textColor = [UIColor whiteColor];
//    
////    miniLabel.text =[NSString stringWithFormat:@"%@安全支付",[WaHomeData sharedHomeData].usermodel.merchantName];
//    
//    miniLabel.textAlignment = NSTextAlignmentCenter;
//    
//    [titleView addSubview:miniLabel];
//    
//    self.navigationItem.titleView = titleView;
//}

//设置navigation左侧
- (void)setLeftNavigation:(NSString *)title{
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, NAV_HEIGHT)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 20)];
    imageview.image = [BundleImage getBundlImage:@"back"];
    imageview.center = CGPointMake(5, backButton.center.y);
    [backButton addSubview:imageview];
    
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setExclusiveTouch:YES];
    
    [backButton setTitle:title forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
}

- (void)setLeftNavigationHide{
    
//    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, NAVIGATION_HEIGHT)];
//    
//     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
}

//返回按钮
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//显示等待视图
-(void)showProgressHUD {
    _progressHUD.labelText = nil;
    _progressHUD.detailsLabelText = nil;
    _progressHUD.mode = SDProgressHUDModeIndeterminate;
    [self.view addSubview: _progressHUD];
    [self.view bringSubviewToFront:_progressHUD];
    [_progressHUD show:YES];
}

//隐藏等待视图
-(void)hideProgressHUD
{
    [_progressHUD hide:YES];
}

//显示toast
-(void)toastInfo:(NSString *)message
{
    
    if (!_progressHUD) {
        _progressHUD = [[SDProgressHUD alloc] initWithView:self.view];
        _progressHUD.delegate = self;
        [self.view addSubview:_progressHUD];
        [self.view bringSubviewToFront:_progressHUD];
        
        if (message.length > 15) {
            _progressHUD.labelText = nil;
            _progressHUD.detailsLabelText = message;
        }
        else
        {
            _progressHUD.labelText = message;
            _progressHUD.detailsLabelText = nil;
            _progressHUD.labelFont = [UIFont systemFontOfSize:15.0];
        }
    }
    [self.view bringSubviewToFront:_progressHUD];
    
    if (message.length > 15) {
        _progressHUD.labelText = nil;
        _progressHUD.detailsLabelText = message;
    }
    else
    {
        _progressHUD.labelText = message;
        _progressHUD.detailsLabelText = nil;
        _progressHUD.labelFont = [UIFont systemFontOfSize:15.0];
    }
    _progressHUD.mode=SDProgressHUDModeText;
    [_progressHUD show:YES];
    NSTimeInterval interval = 3;
    [_progressHUD hide:YES afterDelay:interval];
}

//显示带图片的tost
//- (void)toastOK:(NSString *)message{
//    if (!_progressHUD) {
//        _progressHUD = [[SDProgressHUD alloc] initWithView:self.view];
//        _progressHUD.delegate = self;
//        [self.view addSubview:_progressHUD];
//        [self.view bringSubviewToFront:_progressHUD];
//        _progressHUD.labelText = message;
//        _progressHUD.labelFont = [UIFont systemFontOfSize:15.0];
//    }
//    [self.view bringSubviewToFront:_progressHUD];
//    [_progressHUD show:YES];
//    _progressHUD.labelText = message;
//    _progressHUD.labelFont = [UIFont systemFontOfSize:15.0];
//    _progressHUD.mode= SDProgressHUDModeCustomView;
//    _progressHUD.customView = [[UIImageView alloc] initWithImage:[BundleImage getBundlImage:@"ges_ok"]];
//    [_progressHUD show:YES];
//    NSTimeInterval interval = 3;
//    [_progressHUD hide:YES afterDelay:interval];
//}


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
