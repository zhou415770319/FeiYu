//
//  XWDataCacheTool.h
//  新闻
//
//  Created by user on 15/10/5.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWDataCacheTool : NSObject

+(void)addArr:(NSArray*)arr andId:(NSString*)idstr;
+(void)addDict:(NSDictionary*)dict andId:(NSString*)idstr;
+(void)addData:(NSData *)data andId:(NSString *)idstr;


//返回数据为data
+(NSData*)dataWithID:(NSString*)ID;
//返回数据为Arr
+(NSArray *)dataArrWithID:(NSString *)ID;


+(void)deleteWidthId:(NSString*)ID;

@end
