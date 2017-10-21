//
//  ZFSelectMenuManager.m
//  FeiYu
//
//  Created by 周飞 on 2017/10/21.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFSelectMenuManager.h"

@implementation ZFSelectMenuManager

+(SZFoldawayButton *)menuWithFrame:(CGRect)frame superView:(UIView *)superView{
    
    SZFoldawayModel *model = [[SZFoldawayModel alloc] initWithmMainBtnTitle:@"" selectTitle:@"" backColor:[UIColor blackColor] image:@"icon_tabbar_misc" selectImage:@""];
    model.subBtnTitles = @[@"壹", @"贰", @"叁", @"肆", @"伍"];
    model.subBtnColors = @[[UIColor purpleColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor lightGrayColor]];
    
    SZFoldawayButton *btn = [[SZFoldawayButton alloc] initWithRect:frame andFoldAwayModel:model];
    btn.showType = showTypeOfCircle;
    btn.automaticShowDirection = YES;
    btn.disperseDistance = 60;
    [btn showInView:superView];
    btn.clickSubButtonBack = ^(int index, NSString *title, BOOL select){
        NSLog(@"%zd -- %@ --  %zd", index, title, select);
        
        NSString *customURL;
        switch (index) {
            case 0:
                 customURL= [NSString stringWithFormat:@"%@://Main",@"FeiYu-Login"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
                break;
                
            case 1:
                customURL= [NSString stringWithFormat:@"%@://Main2",@"FeiYu-Login"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
                break;
                
            case 2:
                customURL= [NSString stringWithFormat:@"%@://Main3",@"FeiYu-Login"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
                break;
            case 3:
                customURL= [NSString stringWithFormat:@"%@://Main4",@"FeiYu-Login"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
                break;
            case 4:
                customURL= [NSString stringWithFormat:@"%@://Main5",@"FeiYu-Login"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
                break;
                
            default:
                break;
        }
        
    };
    return btn;
}

@end
