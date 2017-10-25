//
//  CustomViewTool.m
//  ZFSwiftCode
//
//  Created by w on 16/7/18.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "CustomViewTool.h"

@implementation CustomViewTool

#pragma mark  初始化lable
+(UILabel *)labelWithTitle:(NSString *)title{
    UILabel *urlLabel = [[UILabel alloc]init];
    urlLabel.backgroundColor = [UIColor clearColor];
    urlLabel.font =TEXTSIZEBIG;
    
    urlLabel.textAlignment =NSTextAlignmentLeft;
    urlLabel.text = title;
    return urlLabel;
}


+(UIButton *)ButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font =TEXTSIZESMALL;
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.tag = tag;
    
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    btn.clipsToBounds =YES;
    btn.layer.cornerRadius = 5;
    [superView addSubview:btn];
    return btn;
}

@end
