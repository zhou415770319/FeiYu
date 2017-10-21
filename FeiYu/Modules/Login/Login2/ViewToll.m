//
//  ViewToll.m
//  FASTPAY
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ViewToll.h"

@implementation ViewToll


+ (UIViewController *)viewController:(UIView *)view {
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}



@end
