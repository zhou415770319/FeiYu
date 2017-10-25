//
//  NewsMainViewController.m
//  ZFSwiftCode
//
//  Created by w on 16/7/12.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NewsMainViewController.h"
#import "CustomNewsViewController.h"
#import "SXTitleLable.h"
#import "SwiftVViewController.h"

//上面滑动栏的高度
#define ZF_SmallScrollMenuH  40

@interface NewsMainViewController ()<UIScrollViewDelegate>

//segment选择视图
@property (nonatomic,weak) UISegmentedControl *segment;
//大的滑动视图
@property (nonatomic,weak) UIScrollView *bigScroll;
//小的滑动视图
@property (nonatomic,weak) UIScrollView *smallScroll;

@property(nonatomic,strong) SXTitleLable *oldTitleLable;
@property (nonatomic,assign) CGFloat beginOffsetX;

/** news信息 */
@property(nonatomic,strong) NSArray *Infos;


@end

@implementation NewsMainViewController


-(NSArray *)Infos{
    if (_Infos == nil) {
        _Infos = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"CocoachinaNewsInfos.plist" ofType:nil]];
    }
    return _Infos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"cocoachina",@"swiftV"]];
    segment.tintColor = [UIColor redColor];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    self.segment = segment;
    self.navigationItem.titleView = segment;
    [self setupScrollView];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark 添加滑动视图
-(void)setupScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    //1.添加小的滚动菜单栏
    UIScrollView *smallScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, ZF_SmallScrollMenuH)];
    [self.view addSubview:smallScroll];
    smallScroll.showsHorizontalScrollIndicator=NO;
    smallScroll.showsVerticalScrollIndicator=NO;
    self.smallScroll=smallScroll;
    
    //2. 添加大的滚动菜单栏
    UIScrollView *bigScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+ZF_SmallScrollMenuH, SCREENWIDTH, (SCREENHEIGHT-ZF_SmallScrollMenuH-64))];
    bigScroll.showsHorizontalScrollIndicator=NO;
    bigScroll.delegate=self;
    [self.view addSubview:bigScroll];
    self.bigScroll=bigScroll;
    
    
    //3.添加子控制器
    [self addController];
    //4.添加标题栏
    [self addLabel];
    //5.设置大的scrollview的滚动范围
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScroll.contentSize = CGSizeMake(contentX, 0);
    self.bigScroll.pagingEnabled = YES;
    
    //6.添加默认子控制器 (也就是第一个)
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScroll.bounds;
    [self.bigScroll addSubview:vc.view];
    SXTitleLable *lable = [self.smallScroll.subviews firstObject];
    lable.scale = 1.0;
    
}

//删除所有的View
-(void)removeViewFromSuperView{
    [self.smallScroll removeFromSuperview];
    [self.bigScroll removeFromSuperview];
}

#pragma mark 添加子控制器
-(void)addController
{
    if (self.childViewControllers.count >=1) {
        for (UIViewController *VC in self.childViewControllers) {
            [VC removeFromParentViewController];
        }
    }

    switch (self.segment.selectedSegmentIndex) {
        case 0:
            for (int i=0 ; i<self.Infos.count ;i++){
                CustomNewsViewController *vc = [[CustomNewsViewController alloc]init];
                
                vc.title = self.Infos[i][@"title"];
                vc.urlString = self.Infos[i][@"urlString"];
                
                [self addChildViewController:vc];
            }
            break;
        case 1:
            for (int i=0 ; i<self.Infos.count ;i++){
                SwiftVViewController *vc = [[SwiftVViewController alloc]init];
                
                vc.title = self.Infos[i][@"title"];
                vc.urlString = self.Infos[i][@"urlString"];
                
                [self addChildViewController:vc];
            }
            break;
        default:
            break;
    }
    
}

#pragma mark 添加标题栏
-(void)addLabel
{
    CGFloat lblW = 70;
    CGFloat lblH = 40;
    CGFloat lblY = 0;
    CGFloat lblX =0;
    for (int i=0 ; i<self.Infos.count ;i++){
        lblX = i * lblW;
        SXTitleLable *lbl1 = [[SXTitleLable alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont fontWithName:@"HYQiHei" size:19];
        [self.smallScroll addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    //设置小scroll滚动的范围
    self.smallScroll.contentSize=CGSizeMake(lblW*self.Infos.count, 0);
    
    
    
}

#pragma mark 标签栏的点击事件
-(void)lblClick:(UITapGestureRecognizer *)recognizer
{
    SXTitleLable *titlelable = (SXTitleLable *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * self.bigScroll.frame.size.width;
    
    CGFloat offsetY = self.bigScroll.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    
    [self.bigScroll setContentOffset:offset animated:YES];
}


#pragma mark - ******************** scrollView代理方法
/** 滚动结束（手势导致） */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/** 滚动结束后调用（代码导致） */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView

{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScroll.frame.size.width;
    
    // 滚动标题栏
    SXTitleLable *titleLable = (SXTitleLable *)self.smallScroll.subviews[index];
    
    CGFloat offsetx = titleLable.center.x - self.smallScroll.frame.size.width * 0.5;
    
    CGFloat offsetMax = self.smallScroll.contentSize.width - self.smallScroll.frame.size.width;
    
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    
    CGPoint offset = CGPointMake(offsetx, self.smallScroll.contentOffset.y);
    //  NSLog(@"%@",NSStringFromCGPoint(offset));
    [self.smallScroll setContentOffset:offset animated:YES];
    // 添加控制器
    CustomNewsViewController *newsVc = self.childViewControllers[index];
    newsVc.index = index;
    
    
    
    
    [self.smallScroll.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index) {
            SXTitleLable *temlabel = self.smallScroll.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    
    if (newsVc.view.superview) return;
    
    newsVc.view.frame = scrollView.bounds;
    [self.bigScroll addSubview:newsVc.view];
}



/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    SXTitleLable *labelLeft = self.smallScroll.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScroll.subviews.count) {
        
        SXTitleLable *labelRight = self.smallScroll.subviews[rightIndex];
        
        labelRight.scale = scaleRight;
    }
    
}


-(void)segmentClick:(UISegmentedControl *)segment{
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            self.Infos = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"CocoachinaNewsInfos.plist" ofType:nil]];
            //1.添加滑动视图
            [self removeViewFromSuperView];
            [self setupScrollView];
            break;
        case 1:
            self.Infos = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"SwiftVNewsInfos.plist" ofType:nil]];
            //1.添加滑动视图
            [self removeViewFromSuperView];
            [self setupScrollView];
            break;
        default:
            break;
    }
    
    
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
