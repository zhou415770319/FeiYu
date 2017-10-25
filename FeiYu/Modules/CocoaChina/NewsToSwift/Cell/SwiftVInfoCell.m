//
//  SwiftVInfoCell.m
//  ZFSwiftCode
//
//  Created by w on 16/7/22.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "SwiftVInfoCell.h"

@interface SwiftVInfoCell()

@property(nonatomic,retain)UILabel *title;

@property(nonatomic,retain)UIImageView *icon;

@property(nonatomic,retain)UILabel *des;

@property(nonatomic,retain)UIView *lineView;

@end

@implementation SwiftVInfoCell

-(id)initWithFrameModel:(SwiftVInfoCellFrameModel *)frameModel{
    // 1.定义一个标识
    NSString *ID = @"swiftvcell";
    
    // 2.去缓存池中取出可循环利用的cell
    SwiftVInfoCell *cell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 3.如果缓存中没有可循环利用的cell
    if (cell == nil) {
        cell = [[SwiftVInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    _frameModel = frameModel;
    
    self = [super init];
    if (self) {
        // 添加所有需要显示的子控件
        [self setupViews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) setupViews {
    
    self.title = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.title];
    [self addSubview:self.title];
    self.title.numberOfLines = 0;
    
    self.icon = [[UIImageView alloc] init];
    [self.icon sd_setImageWithURL:[NSURL URLWithString:self.frameModel.cellInfo.imgUrl] placeholderImage:[UIImage imageNamed:@"0"]];
    [self addSubview:self.icon];
    
    self.des = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.newsInfo];
    [self addSubview:self.des];
    
    self.des.font =TEXTSIZEMIDDLE;
    self.des.numberOfLines = 0;
    
    
    self.lineView =[[UIView alloc]init];
    self.lineView.backgroundColor =[UIColor lightGrayColor];
    [self addSubview:self.lineView];
    
    self.title.frame = self.frameModel.titleF;
    self.icon.frame =self.frameModel.iconF;
    self.des.frame =self.frameModel.desF;
    
    self.lineView.frame =self.frameModel.lineViewF;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
