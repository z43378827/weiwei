//
//  UIBarButtonItem+Extension.h
//  weiwei
//
//  Created by wanggeng on 15/9/20.
//  Copyright © 2015年 GENG. All rights reserved.
//

/**
 *  系统提供不能够满足需求,自定义分类.
 */

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 * 初始化一个UIBarButtonItem 可以直接设置 默认 和高亮 图片 并且添加点击事件..
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hitImage addTarget:(id)target action:(SEL)action;
@end
