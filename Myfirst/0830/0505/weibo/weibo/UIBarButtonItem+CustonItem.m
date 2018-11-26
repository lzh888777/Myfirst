//
//  UIBarButtonItem+CustonItem.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "UIBarButtonItem+CustonItem.h"

@implementation UIBarButtonItem (CustonItem)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon target:(id)target action:(SEL)action{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    NSString *highImageName = [NSString stringWithFormat:@"%@_highlighted",icon];
    [leftBtn setBackgroundImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];
    leftBtn.bounds = CGRectMake(0, 0, leftBtn.currentBackgroundImage.size.width, leftBtn.currentBackgroundImage.size.height);
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}


@end
