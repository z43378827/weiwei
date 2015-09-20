//
//  WGHomeVCtrl.m
//  weiwei
//
//  Created by wanggeng on 15/9/20.
//  Copyright © 2015年 GENG. All rights reserved.
//

#import "WGHomeVCtrl.h"
#import "UIBarButtonItem+Extension.h"
@interface WGHomeVCtrl ()

@end

@implementation WGHomeVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];

        //设置导航栏左右的按钮
    [self setNav];
}

/**
 * 设置导航栏左右的按钮
 */
- (void)setNav{
  
    //设置导航栏左右的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem
                                             
                                             itemWithImage:@"navigationbar_friendsearch"hltImage:@"navigationbar_friendsearch_highlighted"
                                             addTarget:self action:@selector(friendsearch:)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem
                                              itemWithImage:@"navigationbar_pop"
                                              hltImage:@"navigationbar_pop_highlighted"
                                              addTarget:self action:@selector(pop:)];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark -私有方法-导航左右按钮点击事件
- (void)friendsearch:(UIButton *)btn{
    NSLog(@"%s",__func__);
}

- (void)pop:(UIButton *)btn{
    NSLog(@"%s",__func__);

}

@end
