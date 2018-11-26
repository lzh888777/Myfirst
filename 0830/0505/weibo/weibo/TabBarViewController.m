//
//  TabBarViewController.m
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "UIImage+loadImage.h"
#import "TabBar.h"
#import "NavViewController.h"
#import "WriteMessViewController.h"

@interface TabBarViewController ()<TabBarDelegate>

@property (weak,nonatomic)TabBar *custumTabBar;

@end

@implementation TabBarViewController

- (void)setUpChildViewController:(UIViewController *)childvc title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectimageName
{
    childvc.title = title;
    UIImage *selectimage = [UIImage imageWithName:selectimageName];
    if (ios7) {
        selectimage = [selectimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childvc.tabBarItem.image = [UIImage imageWithName:imageName];
    childvc.tabBarItem.selectedImage = selectimage;

//    UITabBarItem *item = [[UITabBarItem alloc]init];
//    item.selectedImage = selectimage;
//    item.image = [UIImage imageWithName:imageName];
//    item.title = title;
    
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:childvc];
    
    
    
    
    [self addChildViewController:nav];
    
    
    
    [self.custumTabBar addTabBarButtonWithItem:childvc.tabBarItem];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setUpTabbar];
    
    [self setUpAllChildViewController];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setUpTabbar{
    TabBar *custumTabBar = [[TabBar alloc]init];
    custumTabBar.frame = self.tabBar.bounds;
    custumTabBar.delegate = self;
    [self.tabBar addSubview:custumTabBar];
    self.custumTabBar = custumTabBar;
}

- (void)setUpAllChildViewController
{
    
    HomeViewController *home = [[HomeViewController alloc]init];
    [self setUpChildViewController:home title:@"首页" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    
    MessageViewController *message = [[MessageViewController alloc]init];
    message.tabBarItem.badgeValue = @"2";
    [self setUpChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    
    DiscoverViewController *disc = [[DiscoverViewController alloc]init];
    [self setUpChildViewController:disc title:@"广场" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    
    MeViewController *me = [[MeViewController alloc]init];
    [self setUpChildViewController:me title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
}

- (void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to{
//    NSLog(@"--%d --%d",from,to);
    self.selectedIndex = to;
}

- (void)tabBardidClickAddButton{
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:[[WriteMessViewController alloc]init]];
    [self presentViewController:nav animated:YES completion:nil];
    
    
}

@end
