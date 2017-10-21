//
//  BaseViewController.h
//  YMF
//
//  Created by Mac on 16/9/6.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDProgressHUD.h"

@interface BaseViewController : UIViewController<SDProgressHUDDelegate>
@property (nonatomic, strong) SDProgressHUD *progressHUD;
@property (nonatomic, assign)BOOL isHidenTabBar;


-(void)setLeftNavigation:(NSString *)title;

- (void)setLeftNavigationHide;
-(void)setNavigationTitle:(NSString *)title;
-(void)backAction;

-(void)showProgressHUD;
-(void)hideProgressHUD;
-(void)toastInfo:(NSString *)message;
- (void)toastOK:(NSString *)message;

@end
