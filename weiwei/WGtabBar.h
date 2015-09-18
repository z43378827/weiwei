//
//  WGtabBar.h
//  weiwei
//
//  Created by wanggeng on 15/9/18.
//  Copyright (c) 2015年 GENG. All rights reserved.

#import <UIKit/UIKit.h>

/**
 *  点击事件需要传递出去.自己来作不太符合设计标准.可以用代理.或者block来传递
 */

@class WGtabBar;

@protocol WGtabBarDelegate <NSObject,UITabBarDelegate>

- (void)tabBar:(WGtabBar *)tabBar plusButton:(UIButton *)btn;

@end

@interface WGtabBar : UITabBar

@property (nonatomic,weak) id<WGtabBarDelegate> delegate;

@end
