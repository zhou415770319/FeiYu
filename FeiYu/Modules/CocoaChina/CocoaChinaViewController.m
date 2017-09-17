//
//  CocoaChinaViewController.m
//  FeiYu
//
//  Created by 周飞 on 2017/9/17.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "CocoaChinaViewController.h"

@interface CocoaChinaViewController ()

@end

@implementation CocoaChinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    /**** 添加子控制器 ****/
    
    
    // Do any additional setup after loading the view.
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"精华" image:@"tab_home_n" selectedImage:@"tab_home_h"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"新帖" image:@"tab_comment_n" selectedImage:@"tab_comment_h"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:nil image:nil selectedImage:nil];
    
    [self setupOneChildViewController:[[UIViewController alloc] init] title:@"关注" image:@"tab_more_n" selectedImage:@"tab_more_h"];
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
