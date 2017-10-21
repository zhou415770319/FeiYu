//
//  BundleImage.m
//  MobilePaySdk
//
//  Created by wangxin on 15/5/28.
//  Copyright (c) 2015年 wangxin. All rights reserved.
//

#import "BundleImage.h"


@implementation BundleImage


#define BUNDLE_NAME @"walletBundle.bundle"

#define BUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: BUNDLE_NAME]

#define BUNDLE [NSBundle bundleWithPath: BUNDLE_PATH]


+(NSString *)getBundlePath:(NSString *)filename
{
    NSBundle * libBundle = BUNDLE;
    
    if ( libBundle && filename )
    {
        NSString * s=[[libBundle resourcePath ] stringByAppendingPathComponent : filename];
        NSLog ( @"%@" ,s);
        return s;
        
    }
    
    NSLog(@"err");
    return nil ;
}

+(UIImage *)getBundlImage:(NSString *)filename
{
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"walletBundle" withExtension:@"bundle"]];
    if (bundle && filename )
    {
        UIImage *img = [UIImage imageWithContentsOfFile:[bundle pathForResource:filename ofType:@"png"]];
        /**
         *  如果bundle中不存在filename图片 则从本地读取图片
         */
        if (img == nil) {
            img = [UIImage imageNamed:filename];
        }
        return img;
    }
   
    return nil;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
