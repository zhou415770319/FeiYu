//
//  SwiftInfoCell.h
//  ZFSwiftCode
//
//  Created by w on 16/7/22.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTableViewCell.h"

@interface SwiftInfoCell : ZFTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
