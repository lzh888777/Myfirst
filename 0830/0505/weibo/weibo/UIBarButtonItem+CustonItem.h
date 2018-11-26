//
//  UIBarButtonItem+CustonItem.h
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustonItem)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;

@end
