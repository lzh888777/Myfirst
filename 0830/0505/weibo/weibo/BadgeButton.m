//
//  BadgeButton.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "BadgeButton.h"

@implementation BadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;

    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
        CGFloat badgeW = badgeSize.width + 10;
        
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
        
    }else{
        self.hidden = YES;
    }

}

@end
