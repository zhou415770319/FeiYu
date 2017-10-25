//
//  ZFAFNetworkingToll.h
//  ZFSwiftCode
//
//  Created by w on 16/7/7.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFAFNetworkingToll : NSObject


//获取html内容
+ (void)requestHtmlWithUrlString:(NSString *)urlString Parameters:(NSDictionary *)parameters IdStr:(NSString *)idStr Success:(void(^)(NSData *data))success Failture:(void(^)(id error))failture;


//请求新闻列表的方法 这个是缓存的（下拉刷新）如果idStr有值得话就缓存，没值就不缓存。
+ (void)requestWithUrl:(NSString *)url Parameters:(NSDictionary *)parameters Success:(void(^)(id json))success Failture:(void(^)(id error))failture;


@end
