//
//  NewsCell.m
//  ZFSwiftCode
//
//  Created by w on 16/7/9.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"
#import "CustomViewTool.h"
@interface NewsCell()

@property(nonatomic,retain)UILabel *title;

@property(nonatomic,retain)UIImageView *icon;

@property(nonatomic,retain)UILabel *des;

@property(nonatomic,retain)UILabel *postTime;

@property(nonatomic,retain)UILabel *category;

@property(nonatomic,retain)UILabel *source;

@property(nonatomic,retain)UIView *lineView;


@end

@implementation NewsCell

-(id)initWithFrameModel:(ZFTableViewCellFrameModel *)frameModel{
    // 1.定义一个标识
    NSString *ID = @"TODOcell";
    
    // 2.去缓存池中取出可循环利用的cell
    NewsCell *cell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 3.如果缓存中没有可循环利用的cell
    if (cell == nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
    
    self.postTime = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.postTime];
    [self addSubview:self.postTime];

    self.postTime.font =TEXTSIZESMALL;
    self.category = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.category];
    [self addSubview:self.category];

    self.category.font =TEXTSIZESMALL;
    self.source = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.source];
    [self addSubview:self.source];

    self.source.font =TEXTSIZESMALL;
    self.lineView =[[UIView alloc]init];
    self.lineView.backgroundColor =[UIColor lightGrayColor];
    [self addSubview:self.lineView];
    
    self.title.frame = self.frameModel.titleF;
    self.icon.frame =self.frameModel.iconF;
    self.des.frame =self.frameModel.desF;
    self.postTime.frame =self.frameModel.timeF;
    self.category.frame =self.frameModel.categoryF;
    self.source.frame =self.frameModel.sourceF;
    self.lineView.frame =self.frameModel.lineViewF;
    
}


@end
