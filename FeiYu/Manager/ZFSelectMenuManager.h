//
//  ZFSelectMenuManager.h
//  FeiYu
//
//  Created by 周飞 on 2017/10/21.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SZFoldawayButton.h"

@interface ZFSelectMenuManager : NSObject

+(SZFoldawayButton *)menuWithFrame:(CGRect)frame superView:(UIView *)superView;
    
@end
