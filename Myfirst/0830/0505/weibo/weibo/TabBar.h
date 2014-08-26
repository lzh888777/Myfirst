//
//  TabBar.h
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;
- (void)tabBardidClickAddButton;

@end

@interface TabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (weak,nonatomic)id<TabBarDelegate>delegate;

@end
