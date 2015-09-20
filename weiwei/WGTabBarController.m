//
//  WGTabBarController.m
//  weiwei
//
//  Created by wanggeng on 15/9/18.
//  Copyright (c) 2015年 GENG. All rights reserved.
//

#import "WGTabBarController.h"
#import "WGtabBar.h"
#import "WGHomeVCtrl.h"

@interface WGTabBarController ()<WGtabBarDelegate>

@end

@implementation WGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WGtabBar * tabBar = [[WGtabBar alloc]init];
    
    //这里不设置代理,直接自动调用UItabBarController的代理.
    //tabBar.delegate = self;
    
    //通过kvc 来添加只读的按钮
    [self setValue:tabBar forKeyPath:@"tabBar"];

    WGHomeVCtrl * homeCtrl =[[WGHomeVCtrl alloc]init];
    [self addChildViewControllerWithTitle:@"首页" mage:@"tabbar_home" ctrl:homeCtrl];
    
    UIViewController *messageCtrl  =[[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"消息" mage:@"tabbar_message_center" ctrl:messageCtrl];
    
    UIViewController * discoverCtrl =[[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"发现" mage:@"tabbar_discover" ctrl:discoverCtrl];
    
    UIViewController * profileCtrl =[[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"我" mage:@"tabbar_profile" ctrl:profileCtrl];

}
//设置添加控制器的方法


- (void)addChildViewControllerWithTitle:(NSString *)title mage:(NSString *)imageName ctrl:(UIViewController *)ctrl{
    
    ctrl.view.backgroundColor =[UIColor whiteColor];
    
    //设置图片的偏移可以调整距离.
   // ctrl.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
   
    //设置tabbar和导航 的title的文字
//    ctrl.tabBarItem.title = title;
//    ctrl.navigationController.title = title;
    ctrl.title = title;
    
    //初始化文字属性  ,设置文字的前景色为橙色
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    //设置tabbarItem 标题的文字属性
    [ctrl.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    
    ctrl.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //解决图片变蓝的问题,设置渲染是默认的.
    UIImage * oriqinalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];

    ctrl.tabBarItem.selectedImage = [oriqinalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    //添加导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:ctrl];
    
    
    [self addChildViewController:nav];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tabbarButtonDelegate
/**
 * 在代理方法里面写点击按钮的逻辑,
 */
- (void)tabBar:(WGtabBar *)tabBar plusButton:(UIButton *)btn{
    NSLog(@"%s",__func__);
    
    
}

@end
