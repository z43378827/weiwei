//
//  WGtabBar.m
//  weiwei
//
//  Created by wanggeng on 15/9/18.
//  Copyright (c) 2015年 GENG. All rights reserved.
//

#import "WGtabBar.h"
#import "UIView+extension.h"


@interface WGtabBar ()

@property (nonatomic, weak)  UIButton  *plusBtn;
@end

@implementation WGtabBar

/**
 * @dynamic 代表已经实现了set 和 get方法 
 */
@dynamic delegate;


// 重写 init 方法
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //初始话中间的加号按钮
        UIButton * plusButton = [[UIButton alloc]init];
        
        //设置 按钮 默认和高亮状态图片
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        //设置按钮的图片
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        
        //给按钮添加点击事件
        [plusButton addTarget:self action:@selector(pushCtrl:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //属性记录
        self.plusBtn = plusButton;
        
        [self addSubview:plusButton];
        
    }
    return self;
}

//设置大小
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置button的大小 等于背景图片大小
    self.plusBtn.size = [self.plusBtn.currentBackgroundImage size];
    
    //设置在父类的中心位置
    self.plusBtn.centerX = self.centerX;
    self.plusBtn.centerY = self.height *0.5;
    
    NSLog(@"%@",self.subviews);
    
    //平均每个 tabBarButton 的宽度
    CGFloat tabBarButtonWidth = self.width / 5;
    
    //记录为第几个按钮
    NSInteger buttonInteger = 0;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *childView = self.subviews[i];
        
        //调整tabarButton的按钮位置 ,其他的view不用管
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            NSLog(@"%@",childView);
            //设置宽度
            childView.width = tabBarButtonWidth;
            if (buttonInteger == 2) {
                buttonInteger++;
            }
            
            //设置位置
            childView.x = buttonInteger * tabBarButtonWidth;
            
            buttonInteger++;
            
        }
    }
    
    
    
}


- (void)pushCtrl:(UIButton *)plusBtn{
    NSLog(@"plusButtonClick");
    //到控制器里写逻辑
    if ([self.delegate respondsToSelector:@selector(tabBar:plusButton:)]) {
        [self.delegate tabBar:self plusButton:plusBtn];
    }
}

@end
