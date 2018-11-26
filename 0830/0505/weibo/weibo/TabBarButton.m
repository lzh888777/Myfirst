//
//  TabBarButton.m
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "TabBarButton.h"
#import "BadgeButton.h"

#define TabBarButtonRatio 0.6
#define TabBarButtonTitleColor ios7 ?[UIColor blackColor]:[UIColor whiteColor]
#define TabBarButtonTitleSelectedColor (ios7 ? Color(234,103,7) :Color(248,139,0))

@interface TabBarButton()

@property (weak,nonatomic)BadgeButton *badgeButton;

@end

@implementation TabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:TabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:TabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        
        if (!ios7) {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        BadgeButton *badgeButton = [[BadgeButton alloc]init];
//        badgeButton.imageView.image = [UIImage imageWithName:@"main_badge"];
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    CGFloat badgeY = 0;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
    
}

-(void)dealloc{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)setHighlighted:(BOOL)highlighted{
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    
    return CGRectMake(0, contentRect.size.height * TabBarButtonRatio, contentRect.size.width, contentRect.size.height * TabBarButtonRatio-10);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, 5, contentRect.size.width, contentRect.size.height * (1 - TabBarButtonRatio));
}

@end
