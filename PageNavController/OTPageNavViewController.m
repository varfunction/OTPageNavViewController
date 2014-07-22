//
//  OTPageNavViewController.m
//  PageNavController
//
//  Created by ocean tang on 14-7-14.
//  Copyright (c) 2014年 ocean tang. All rights reserved.
//

#import "OTPageNavViewController.h"
#import "OTPageNavBar.h"

@interface OTPageNavViewController ()

@property (nonatomic, strong) OTPageNavBar *pageNavBar;

@property (nonatomic, strong) UIScrollView *pageScrollView;

@end

@implementation OTPageNavViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initPageNavBar];
    
    [self initPageNavController];
    
    [self initData];
    
//    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)initPageNavBar
{
    // 设置导航条背景颜色，在iOS7才这么用
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.291 green:0.607 blue:1.000 alpha:1.000]];
    // 设置导航条的返回按钮或者系统按钮的文字颜色，在iOS7才这么用
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    // 设置导航条的title文字颜色，在iOS7才这么用
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]}];
    
    self.pageNavBar = [[OTPageNavBar alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.navigationItem.titleView = self.pageNavBar;
}

- (void)initPageNavController
{
    self.pageScrollView = [[UIScrollView alloc] init];
    self.pageScrollView.frame = self.view.bounds;
    self.pageScrollView.bounces = NO;
    self.pageScrollView.pagingEnabled = YES;
    self.pageScrollView.delegate = self;
    self.pageScrollView.showsVerticalScrollIndicator = NO;
    self.pageScrollView.showsHorizontalScrollIndicator = NO;
    [self.pageScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds) * self.viewControllers.count, CGRectGetHeight(self.view.bounds))];
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        CGRect contentViewFrame = viewController.view.bounds;
        contentViewFrame.origin.x = idx * CGRectGetWidth(self.view.bounds);
        viewController.view.frame = contentViewFrame;
        
        [self.pageScrollView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }];
    
    [self.view addSubview:self.pageScrollView];
}

- (void)initData
{
    self.pageNavBar.titles = @[@"tab1", @"tab2", @"tab3", @"tab4", @"tab5"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageNavBar.contentOffset = scrollView.contentOffset;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/CGRectGetWidth(scrollView.bounds);
    self.pageNavBar.currentPage = page;
}

@end
