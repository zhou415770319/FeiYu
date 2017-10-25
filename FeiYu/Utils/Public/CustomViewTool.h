//
//  CustomViewTool.h
//  ZFSwiftCode
//
//  Created by w on 16/7/18.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomViewTool : NSObject

+(UILabel *)labelWithTitle:(NSString *)title;


+(UIButton *)ButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag;


@end
