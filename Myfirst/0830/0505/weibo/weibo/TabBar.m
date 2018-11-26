//
//  TabBar.m
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"

@interface TabBar ()

@property (weak,nonatomic)TabBarButton *selectedButton;
@property (weak,nonatomic)UIButton *plusButton;

@property (strong,nonatomic)NSMutableArray *tabBarButtons;

@end

@implementation TabBar

- (NSMutableArray*)tabBarButtons{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!ios7) {
            
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        [plusButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    TabBarButton *button = [[TabBarButton alloc]init];
    [self addSubview:button];
    
    button.item = item;
    
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self.tabBarButtons addObject:button];
}

- (void)addButtonClick{
    if ([self.delegate respondsToSelector:@selector(tabBardidClickAddButton)]) {
        [self.delegate tabBardidClickAddButton];
    }
}

- (void)buttonClick:(TabBarButton *)button{
    if (button == self.selectedButton) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.plusButton.center = self.center;
    
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index < self.tabBarButtons.count; index ++) {
        
        TabBarButton *button = self.tabBarButtons[index];

        CGFloat buttonX = index *buttonW;
        if (index > 1) {
            buttonX += buttonW ;
        }
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
        if (index == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
}

@end
