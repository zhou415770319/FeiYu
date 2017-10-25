//
//  ZFTableViewCellFrameModel.m
//  ZFSwiftCode
//
//  Created by w on 16/7/9.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "SwiftVInfoCellFrameModel.h"
#import "ZFStringTool.h"
#define PADDING_VIEW_VIEW 5

#define ICONWIDTH 100

#define LABLE_WIDTH (SCREENWIDTH-20)/3


@interface SwiftVInfoCellFrameModel()


@end


@implementation SwiftVInfoCellFrameModel

-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    self.cellInfo =cellInfo;
    //计算 标题的frame
    [self setupTitleFrame];
    
    //计算 描述的frame
//    [self setupdesFrame];
    
    //计算 图片的frame
    [self setupIconFrame];
    
    
    //计算 lineViewF的frame
    [self setupLineViewFrame];
    
    
    self.cellHeightF =CGRectGetMaxY(self.lineViewF);

    
}


-(void)setupTitleFrame{
    self.titleF =CGRectMake(PADDING_VIEW_VIEW, PADDING_VIEW_VIEW, SCREENWIDTH-2*PADDING_VIEW_VIEW, [ZFStringTool getStrSize:self.cellInfo.title andTexFont:TEXTSIZEBIG andMaxSize:CGSizeMake(SCREENWIDTH-2*PADDING_VIEW_VIEW, 90)].height);
}

//-(void)setupdesFrame{
//    _desF =CGRectMake(PADDING_VIEW_VIEW*2+ICONWIDTH, CGRectGetMaxY(_titleF)+PADDING_VIEW_VIEW, SCREENWIDTH-(PADDING_VIEW_VIEW*3+ICONWIDTH), 100);
//}

-(void)setupIconFrame{
//    if (CGRectGetMaxY(_desF)-CGRectGetMinY(_desF)>ICONWIDTH) {
//        _iconF =CGRectMake(PADDING_VIEW_VIEW, (CGRectGetMaxY(_desF)-CGRectGetMinY(_desF)-ICONWIDTH)/2+CGRectGetMaxY(_titleF)+PADDING_VIEW_VIEW, ICONWIDTH, ICONWIDTH);
//    }else{
        self.iconF =CGRectMake(PADDING_VIEW_VIEW, CGRectGetMaxY(self.titleF)+PADDING_VIEW_VIEW, SCREENWIDTH, 800);
//    }
    
}


-(void)setupLineViewFrame{
    self.lineViewF =CGRectMake(PADDING_VIEW_VIEW, CGRectGetMaxY(self.iconF)+PADDING_VIEW_VIEW, SCREENWIDTH-2*PADDING_VIEW_VIEW, 1);
}



@end
