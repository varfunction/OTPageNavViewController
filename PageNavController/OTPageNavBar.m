//
//  OTPageNavBar.m
//  PageNavController
//
//  Created by ocean tang on 14-7-14.
//  Copyright (c) 2014年 ocean tang. All rights reserved.
//

#import "OTPageNavBar.h"

@interface OTPageNavBar ()

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSArray *titleLabelArray;

@end

@implementation OTPageNavBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.frame = CGRectMake(0, 30, CGRectGetWidth(self.bounds), 20);
        self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
        self.pageControl.userInteractionEnabled = NO;
        
        self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        self.pageControl.hidesForSinglePage = YES;
        
        [self addSubview:self.pageControl];
        
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (void)setTitles:(NSArray *)titles
{
    if (_titles != titles) {
        _titles = titles;
        self.pageControl.numberOfPages = self.titles.count;
        self.currentPage = 0;
        
        NSMutableArray *temp = [NSMutableArray array];
        [self.titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.frame = CGRectMake(idx * CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), 30);
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
            titleLabel.text = title;
            
            if (self.currentPage == idx) {
                titleLabel.alpha = 1.0;
            } else {
                titleLabel.alpha = 0.0;
            }
            
            [self addSubview:titleLabel];
            [temp addObject:titleLabel];
        }];
        
        self.titleLabelArray = [NSArray arrayWithArray:temp];
    }
}

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    CGFloat normalWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    [self.titleLabelArray enumerateObjectsUsingBlock:^(UILabel *titleLabel, NSUInteger idx, BOOL *stop) {
        // frame
        CGRect titleLabelFrame = titleLabel.frame;
        //        titleLabelFrame.origin.x = (idx * 200) - (xOffset / 320) * 200;
        titleLabelFrame.origin.x = (idx * 100) - xOffset / 3.2;
        titleLabel.frame = titleLabelFrame;
        
        // alpha
        CGFloat alpha;
        if(xOffset < normalWidth * idx) {
            alpha = (xOffset - normalWidth * (idx - 1)) / normalWidth;
        }else{
            alpha = 1 - ((xOffset - normalWidth * idx) / normalWidth);
        }
        titleLabel.alpha = alpha;
    }];
}

@end
