//
//  ZFBaseTabBarController.h
//  FeiYu
//
//  Created by 周飞 on 2017/9/17.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFBaseTabBarController : UITabBarController


/**
 设置childViewController（系统tabBar）
 
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
