//
//  CocoaChinaViewController.m
//  FeiYu
//
//  Created by 周飞 on 2017/9/17.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "CocoaChinaViewController.h"
#import "PreViewViewController.h"
#import "NewsMainViewController.h"
@interface CocoaChinaViewController ()
@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC
@end

@implementation CocoaChinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar

    
    // Do any additional setup after loading the view.
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
     /**** 添加子控制器 ****/
    [self setupOneChildViewController:[[NewsMainViewController alloc] init] title:nil image:@"tab_home_n" selectedImage:@"tab_home_h"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:nil image:nil selectedImage:nil];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"我" image:@"tab_buddy_nor" selectedImage:@"tab_buddy_press"];
    
    return self;
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
