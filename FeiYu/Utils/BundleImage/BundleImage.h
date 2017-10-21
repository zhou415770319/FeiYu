//
//  BundleImage.h
//  MobilePaySdk
//
//  Created by wangxin on 15/5/28.
//  Copyright (c) 2015年 wangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface BundleImage : NSObject

+(NSString *)getBundlePath:(NSString *)filename;

//获得bundle中的image
+(UIImage *)getBundlImage:(NSString *)filename;

+ (UIImage *)imageWithColor:(UIColor *)color;
@end
