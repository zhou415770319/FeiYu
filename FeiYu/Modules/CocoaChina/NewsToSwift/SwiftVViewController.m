//
//  SwiftVViewController.m
//  ZFSwiftCode
//
//  Created by w on 16/7/21.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "SwiftVViewController.h"

@interface SwiftVViewController ()
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

//总共页数
@property(nonatomic,assign)NSInteger allPageCount;
//当前页数
@property(nonatomic,assign)NSInteger currentPageCount;

@property(nonatomic,retain)ZFTableView *tab;
@end

@implementation SwiftVViewController

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab = [[ZFTableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SELF_VIEW_HEIGHT-NAV_HEIGHT-TABBAR_HEIGHT-40)];
    //    self.tab.delegate = self;
    self.tab.isCustomCell = YES;
    self.tab.heightForHeader = 0;
    self.tab.heightForRow = 150;
    self.tab.cellInfos = self.infos;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];
    
    __unsafe_unretained UITableView *tableView = self.tab;
    
    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getNewsInfoWithPageCount:1];
        
    }];
    
//    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self getNewsInfoWithPageCount:self.currentPageCount+1];
//        
//    }];
    
    [self.tab.mj_header beginRefreshing];
    
    
    // Do any additional setup after loading the view.
}


-(NSMutableArray *)getNewsInfoWithPageCount:(NSInteger)pageCount{
    
//    if (!self.infos) {
        [ZFAFNetworkingToll requestHtmlWithUrlString:[NSString stringWithFormat:@"%@%@",BaseUrl_swiftv,self.urlString] Parameters:nil IdStr:[NSString stringWithFormat:@"SwiftInfo_%@",self.urlString] Success:^(NSData * data) {
            NSString *htmlStr = [NSString UTF8StringWithHZGB2312Data:data];
            NSString *content = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:[NSString stringWithFormat:@"<div class=\"list-bd\">((?!</div>).*)(.*?)</div>"]];
            NSString *pageStr = [ZFSpiderTool spiderOneStringWithString:content pattern:@"<ul class=\"pagination\">.*?<span>(.*?)</span>.*?</ul>"];
            
//            self.allPageCount = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:@"<ul class=\"pagination\">.*?<span>(.*?)</span>.*?</ul>"].integerValue;
//            self.currentPageCount = 1;
//            NSArray *array = [ZFSpiderTool spiderMoreStringWithString:content pattern:
//                              [NSString stringWithFormat:@"<li class=\"autumn-grid autumn-course-grid relative\">.*?<a href=\"(.*?)\">.*?<img src=\"(.*?)\".*?>.*?</a><h3 class=\"course-name\"><a href=\"(.*?)\">(.*?)</a></h3>.*?</li>"] keys:@[@"url",@"imgUrl",@"url",@"title"]];
            NSArray *array = [ZFSpiderTool spiderMoreStringWithString:content pattern:
                              [NSString stringWithFormat:@"<li class=\"autumn-grid autumn-course-grid relative\">.*?<a href=\"(.*?)\">.*?<img src=\"(.*?)\".*?>.*?</a>.*?<h3 class=\"course-name\"><a href=\".*?\">(.*?)</a></h3>.*?</li>"] keys:@[@"url",@"imgUrl",@"title"]];
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *path = [paths objectAtIndex:0];
            [array writeToFile:[NSString stringWithFormat:@"%@/swiftv.plist",path] atomically:YES];
            
            NSMutableArray *temArr =[NSMutableArray arrayWithCapacity:1];
            
            //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cocoaChina" ofType:@"plist"];
            //    NSMutableArray *infosArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
            for (int i =0; i < array.count; i++) {
                
                ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];
                model.cellName = @"SwiftVInfoCell";
                
                model.category = [array[i] objectForKey:@"category"];
                model.imgUrl = [array[i] objectForKey:@"imgUrl"];
                model.newsInfo = [[[array[i] objectForKey:@"newsInfo"] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                model.postTime = [array[i] objectForKey:@"postTime"];
                model.source = [array[i] objectForKey:@"source"];
                model.title = [array[i] objectForKey:@"title"];
                model.url = [array[i] objectForKey:@"url"];
                
                model.PopToViewController = @"NewsWebViewController";
                
                [temArr addObject:model];
            }
            
            self.infos = temArr;
            
            self.tab.cellInfos =self.infos;
            [self.tab reloadData];
            
            [self.tab.mj_header endRefreshing];
            
        } Failture:^(id error) {
            [self.tab.mj_header endRefreshing];
            
        }];
//    }else{
//        
//        NSRange countRange =NSMakeRange(0, 1);
//        countRange.location = [self.urlString rangeOfString:@"."].location-1;
//        NSString *newUrlStr =[self.urlString stringByReplacingCharactersInRange:countRange withString:[NSString stringWithFormat:@"%ld",pageCount]];
//        NSString *requestUrlStr = [NSString stringWithFormat:@"%@%@",BaseUrl_cocoaChina,newUrlStr];
//        [ZFAFNetworkingToll requestHtmlWithUrlString:requestUrlStr Parameters:nil IdStr:[NSString stringWithFormat:@"SwiftInfo_%@",newUrlStr] Success:^(NSData * data) {
//            NSString *htmlStr = [NSString UTF8StringWithHZGB2312Data:data];
//            NSString *content = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:[NSString stringWithFormat:@"<ul id=\"list_holder\">(.*?)</ul>"]];
//            
//            //            self.allPageCount = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:@"<div id=\"page\">.*?<span.*?>.*?<strong>(.*?)</strong>.*?<strong>.*?</strong>.*?</span>.*?</div>"].integerValue;
//            self.currentPageCount = pageCount;
//            NSArray *array = [ZFSpiderTool spiderMoreStringWithString:content pattern:
//                              [NSString stringWithFormat:@"<li>.*?<div class=\"clearfix newstitle\">.*?<a href=\"(.*?)\".*?title=\"(.*?)\">.*?</a>.*?</div>.*?<div class=\"clearfix\">.*?<a href=.*?>.*?<img src=\"(.*?)\".*?>.*?</a>.*?<div class=\"newsinfor\">(.*?)<a.*?>.*?</a>.*?</div>.*?<div class=\"clearfix zx_manage\">.*?<div class=\"float-l\">.*?<span class=\"post-time\">(.*?)</span>.*?<span>(.*?)</span>.*?<span>(.*?)</span>.*?</div>.*?</div>.*?</div>.*?</li>"] keys:@[@"url",@"title",@"imgUrl",@"newsInfo",@"postTime",@"category",@"source"]];
//            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//            NSString *path = [paths objectAtIndex:0];
//            [array writeToFile:[NSString stringWithFormat:@"%@/cocoaChina.plist",path] atomically:YES];
//            
//            NSMutableArray *temArr =[NSMutableArray arrayWithCapacity:1];
//            
//            //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cocoaChina" ofType:@"plist"];
//            //    NSMutableArray *infosArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
//            for (int i =0; i < array.count; i++) {
//                
//                ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];
//                model.cellName = @"SwiftVInfoCell";
//                
//                model.category = [array[i] objectForKey:@"category"];
//                model.imgUrl = [array[i] objectForKey:@"imgUrl"];
//                model.newsInfo = [[[array[i] objectForKey:@"newsInfo"] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//                model.postTime = [array[i] objectForKey:@"postTime"];
//                model.source = [array[i] objectForKey:@"source"];
//                model.title = [array[i] objectForKey:@"title"];
//                model.url = [array[i] objectForKey:@"url"];
//                
//                model.PopToViewController = @"NewsWebViewController";
//                
//                [temArr addObject:model];
//            }
//            [self.infos addObjectsFromArray:temArr];
//            self.tab.cellInfos =self.infos;
//            [self.tab.mj_header endRefreshing];
//            
//            [self.tab.mj_footer endRefreshing];
//            [self.tab reloadData];
//            
//        } Failture:^(id error) {
//            [self.tab.mj_header endRefreshing];
//            
//            [self.tab.mj_footer endRefreshing];
//            
//        }];
//        
//    }
    
    return self.infos;
}


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
