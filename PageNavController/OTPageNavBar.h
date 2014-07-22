//
//  OTPageNavBar.h
//  PageNavController
//
//  Created by ocean tang on 14-7-14.
//  Copyright (c) 2014年 ocean tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTPageNavBar : UIView

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) CGPoint contentOffset;

@end
