//
//  UIBarButtonItem+Extension.m
//  weiwei
//
//  Created by wanggeng on 15/9/20.
//  Copyright © 2015年 GENG. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hitImage addTarget:(id)target action:(SEL)action;{
    
    //用一个自定义的button去做UIBarButtonItem 的customView
    
    //初始化一个button
    UIButton * btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hitImage] forState:UIControlStateHighlighted];
    
    //设置btn的大小
    btn.size = [btn currentImage].size;
    
    //添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return item;
}

@end
