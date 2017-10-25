//
//  NewsInfoCell.m
//  ZFSwiftCode
//
//  Created by w on 16/7/6.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NewsInfoCell.h"

@implementation NewsInfoCell


-(void)drawRect:(CGRect)rect{
    self.title.text = self.cellInfo.title;
    self.imgIcon.image = [UIImage imageNamed:self.cellInfo.imgName];
    self.newsInfo.text = self.cellInfo.newsInfo;
    self.postTime.text = self.cellInfo.postTime;
    self.category.text = self.cellInfo.category;
    self.source.text = self.cellInfo.source;
    
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
