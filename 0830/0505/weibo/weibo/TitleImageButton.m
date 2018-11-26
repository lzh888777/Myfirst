//
//  TitleImageButton.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "TitleImageButton.h"
#define TitleImageButtonRatio 0.8

@implementation TitleImageButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = self.bounds.size.width * TitleImageButtonRatio ;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width - imageX;
    CGFloat imageH = self.bounds.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0 ;
    CGFloat titleY = 0;
    CGFloat titleW = self.bounds.size.width * TitleImageButtonRatio;
    CGFloat titleH = self.bounds.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
