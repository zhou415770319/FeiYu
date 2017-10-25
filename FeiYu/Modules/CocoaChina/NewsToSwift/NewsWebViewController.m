//
//  NewsWebViewController.m
//  ZFSwiftCode
//
//  Created by w on 16/7/6.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NewsWebViewController.h"
#import <WebKit/WebKit.h>

@interface NewsWebViewController ()<UIScrollViewDelegate>

@property(nonatomic,copy)NSString *htmlStr;

@property(nonatomic,copy)NSString *contentStr;

@property(nonatomic,retain)WKWebView * webView;

@property(nonatomic,retain)CALayer * progresslayer;

@end

@implementation NewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHidenTabBar = YES;
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT+TABBAR_HEIGHT)];
    NSURLRequest *request;
    if ([self.cellInfo.cellName isEqualToString:@"SwiftVInfoCell"]) {
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseUrl_swiftv,self.cellInfo.url]]];
    }else{
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseUrl_cocoaChina,self.cellInfo.url]]];
    }
    

    [self.view addSubview: self.webView];
    

    [self.webView loadRequest:request];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 3)];
    progress.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [progress.layer addSublayer:layer];
    self.progresslayer = layer;

//    [self getDetailMainInfoWithUrl:[NSString stringWithFormat:@"%@%@",BaseUrl_cocoaChina,self.cellInfo.url]];

    //
//    [self.webView setScalesPageToFit:YES];
    //缩放网页，但是没有用啊
//    self.webView.scrollView.delegate = self;

}


//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return nil;
//}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    CGFloat webViewHeight=[webView.scrollView contentSize].height;
    
    CGRect newFrame = webView.frame;
    
    newFrame.size.height = webViewHeight;
    
    webView.frame = newFrame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


//-(void)getDetailMainInfoWithUrl:(NSString *)url{
//
//    [ZFAFNetworkingToll requestHtmlWithUrlString:url Parameters:nil IdStr:[NSString stringWithFormat:@"newsInfo_%@",self.cellInfo.url] Success:^(NSData * data) {
//        NSString *htmlStr = [NSString UTF8StringWithHZGB2312Data:data];
////        NSString *content = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:[NSString stringWithFormat:@"<div class=\"detail-main\">((?!</div>).*)(.*?)</div>"]];
//        
//        [self.webView loadHTMLString:htmlStr baseURL:[NSURL URLWithString:BaseUrl_cocoaChina]];
//
//        self.contentStr = htmlStr;
//    } Failture:^(id error) {
//        self.contentStr = error;
//    }];
//    
////    return self.contentStr;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
