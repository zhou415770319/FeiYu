//
//  NewsViewController.m
//  ZFSwiftCode
//
//  Created by w on 16/7/5.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NewsViewController.h"
#import "ZFSpiderTool.h"
#import "ZFTableView.h"
#import "NewsWebViewController.h"
#import "ZFAFNetworkingToll.h"
@interface NewsViewController ()<UITableViewDelegate>
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@property(nonatomic,retain)ZFTableView *tab;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab = [[ZFTableView alloc]initWithFrame:self.view.bounds];
    self.tab.delegate = self;
    self.tab.heightForRow = 200;
    self.tab.cellInfos = self.infos;

    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];
    
    
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)infos{
    [self showProgressHUD];

    if (!_infos) {
        return [self getNewsInfo];
    }
    return _infos;
}


-(NSMutableArray *)getNewsInfo{
    
    [ZFAFNetworkingToll requestHtmlWithUrlString:[NSString stringWithFormat:@"%@/swift/",BaseUrl_cocoaChina] Parameters:nil IdStr:[NSString stringWithFormat:@"newsInfo_/swift/"] Success:^(NSData * data) {
        NSString *htmlStr = [NSString UTF8StringWithHZGB2312Data:data];
        NSString *content = [ZFSpiderTool spiderOneStringWithString:htmlStr pattern:[NSString stringWithFormat:@"<ul id=\"list_holder\">(.*?)</ul>"]];
        NSArray *array = [ZFSpiderTool spiderMoreStringWithString:content pattern:
                          [NSString stringWithFormat:@"<li>.*?<div class=\"clearfix newstitle\">.*?<a href=\"(.*?)\".*?title=\"(.*?)\">.*?</a>.*?</div>.*?<div class=\"clearfix\">.*?<a href=.*?>.*?<img src=\"(.*?)\".*?>.*?</a>.*?<div class=\"newsinfor\">(.*?)<a.*?>.*?</a>.*?</div>.*?<div class=\"clearfix zx_manage\">.*?<div class=\"float-l\">.*?<span class=\"post-time\">(.*?)</span>.*?<span>(.*?)</span>.*?<span>(.*?)</span>.*?</div>.*?</div>.*?</div>.*?</li>"] keys:@[@"url",@"title",@"imgUrl",@"newsInfo",@"postTime",@"category",@"source"]];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        [array writeToFile:[NSString stringWithFormat:@"%@/cocoaChina.plist",path] atomically:YES];
        
        NSMutableArray *temArr =[NSMutableArray arrayWithCapacity:1];
        
        //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cocoaChina" ofType:@"plist"];
        //    NSMutableArray *infosArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
        for (int i =0; i < array.count; i++) {
            
            ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];
            model.xibCellName = @"NewsInfoCell";
            
            model.category = [array[i] objectForKey:@"category"];
            model.imgUrl = [array[i] objectForKey:@"imgUrl"];
            model.newsInfo = [array[i] objectForKey:@"newsInfo"];
            model.postTime = [array[i] objectForKey:@"postTime"];
            model.source = [array[i] objectForKey:@"source"];
            model.title = [array[i] objectForKey:@"title"];
            model.url = [array[i] objectForKey:@"url"];
            
            [temArr addObject:model];
        }
        
        self.infos = temArr;

        [self hideProgressHUD];

    } Failture:^(id error) {
        [self hideProgressHUD];

    }];

    return self.infos;
}



//获取数据
-(NSMutableArray *)controlCategory{
    
    
    NSArray *infosArr = [ZFSpiderTool getCocoaChinaSwiftNews];
    
    
    NSMutableArray *temArr =[NSMutableArray arrayWithCapacity:1];

//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cocoaChina" ofType:@"plist"];
//    NSMutableArray *infosArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    for (int i =0; i < infosArr.count; i++) {
        
        ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];        
        
        model.category = [infosArr[i] objectForKey:@"category"];
        model.imgUrl = [infosArr[i] objectForKey:@"imgUrl"];
        model.newsInfo = [infosArr[i] objectForKey:@"newsInfo"];
        model.postTime = [infosArr[i] objectForKey:@"postTime"];
        model.source = [infosArr[i] objectForKey:@"source"];
        model.title = [infosArr[i] objectForKey:@"title"];
        model.url = [infosArr[i] objectForKey:@"url"];
        
        model.xibCellName = @"NewsInfoCell";
        [temArr addObject:model];
    }
    return temArr;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 200 ;
    //    if (self.heightForRow) {
    //        height =self.heightForRow;
    //    }
    
    return height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    float height = 10;
    //    if (self.heightForHeader) {
    //        height =self.heightForHeader;
    //    }
    
    return height;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NewsWebViewController *pop =[[NewsWebViewController alloc] init];
    ZFTableViewCellModel *model = self.infos[indexPath.row];
    
    pop.cellInfo = model;
    [self.navigationController pushViewController:pop animated:YES];
    
    
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
