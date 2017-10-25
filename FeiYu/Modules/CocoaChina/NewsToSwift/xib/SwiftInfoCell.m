//
//  SwiftInfoCell.m
//  ZFSwiftCode
//
//  Created by w on 16/7/22.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "SwiftInfoCell.h"

@implementation SwiftInfoCell

-(void)drawRect:(CGRect)rect{
    self.title.text = self.cellInfo.title;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:self.cellInfo.imgUrl] placeholderImage:[UIImage imageNamed:@"0"]];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
