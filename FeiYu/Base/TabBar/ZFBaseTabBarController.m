//
//  ZFBaseTabBarController.m
//  FeiYu
//
//  Created by 周飞 on 2017/9/17.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFBaseTabBarController.h"

@interface ZFBaseTabBarController ()

@end

@implementation ZFBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //    vc.view.backgroundColor = wjRandomColor;  // 设置背景为随机色
    vc.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值，判断图片传入值是空还是nil
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nvc];
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
