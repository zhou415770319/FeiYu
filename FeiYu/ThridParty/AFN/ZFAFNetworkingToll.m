//
//  ZFAFNetworkingToll.m
//  ZFSwiftCode
//
//  Created by w on 16/7/7.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFAFNetworkingToll.h"
#import "AFNetworking.h"
#import "XWDataCacheTool.h"

@implementation ZFAFNetworkingToll


+ (void)requestHtmlWithUrlString:(NSString *)urlString Parameters:(NSDictionary *)parameters IdStr:(NSString *)idStr Success:(void(^)(NSData *data))success Failture:(void(^)(id error))failture{
    
    //如果数据库里面有值就先读取数据库
    if(idStr.length>0){
        NSData *data=[XWDataCacheTool dataWithID:idStr];
        if(data.length != 0){
            success(data);
            return;
        }
    }
    
    // 1. url
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2. urlrequet
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    
    NSCachedURLResponse *responsed = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
    
    if (responsed) {
        NSLog(@"这个请求已经存在缓存");
        //这个请求已经存在缓存
        
        // 定期处理缓存
        //        22  //    if (缓存没有达到7天) {
        //        23  //        request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
        //        24  //    }
        //        25  // 获得全局的缓存对象
        //        26  NSURLCache *cache = [NSURLCache sharedURLCache];
        //        27  //    if (缓存达到7天) {
        //        28  //        [cache removeCachedResponseForRequest:request];
        //        29  //    }
        
        NSLog(@"now------>%@",responsed.userInfo);
        success(responsed.data);
        
    }else{
        NSLog(@"这个请求没有缓存");
        //这个请求没有缓存
        //发送请求
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:
                                          ^(NSData *data, NSURLResponse *response, NSError *error) {
                                              
                                              if (!error) {
                                                  NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSDate date] forKey:@"Cached Date"];
                                                  
                                                  NSCachedURLResponse *responsedTask = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
                                                  responsedTask = [[NSCachedURLResponse alloc] initWithResponse:response data:data userInfo:userInfo storagePolicy:NSURLCacheStorageAllowed];
                                                  if(idStr.length>0){
                                                      //发送网络请求获取最新数据  先清空旧的数据
                                                      [XWDataCacheTool deleteWidthId:idStr];
                                                      //做数据缓存
                                                      [XWDataCacheTool addData:data andId:idStr];
                                                  }
                                                  success(data);
                                              }
                                          }];
        
        [dataTask resume];
        
    }
    
}

+ (void)requestWithUrl:(NSString *)url Parameters:(NSDictionary *)parameters Success:(void(^)(id json))success Failture:(void(^)(id error))failture{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:parameters error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            failture(error);
        } else {
            success(responseObject);
        }
    }];
    [dataTask resume];
    
    
}




@end
