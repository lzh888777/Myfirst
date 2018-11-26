//
//  BottomView.m
//  weibo
//
//  Created by 刘志华 on 14-8-26.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "BottomView.h"
#import "StatusFrame.h"
#import "User.h"
#import "Status.h"

@interface BottomView ()

@property (weak,nonatomic)UIButton *retweetedBtn;
@property (weak,nonatomic)UIButton *commentBtn;
@property (weak,nonatomic)UIButton *attitudeBtn;

@property (strong,nonatomic)NSMutableArray *dividerViews;
@property (strong,nonatomic)NSMutableArray *btns;

@end


@implementation BottomView

- (NSMutableArray *)btns{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    
    return _btns;
}

- (NSMutableArray *)dividerViews{
    if (_dividerViews == nil) {
        _dividerViews = [NSMutableArray array];
    }
    
    return _dividerViews;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.image = [UIImage resizeImageWithName:@"common_card_bottom_background"];
        self.highlightedImage = [UIImage resizeImageWithName:@"common_card_bottom_background_highlighted"];
        
        self.retweetedBtn = [self setUpButtonWithImageName:@"timeline_icon_retweet" highlightedImageName:@"timeline_card_leftbottom_highlighted"];
        self.commentBtn = [self setUpButtonWithImageName:@"timeline_icon_comment" highlightedImageName:@"timeline_card_middlebottom_highlighted"];
        self.attitudeBtn = [self setUpButtonWithImageName:@"timeline_icon_unlike" highlightedImageName:@"timeline_card_rightbottom_highlighted"];

        
        for (int i = 0; i < 2; i ++) {
            UIImageView *divideView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"timeline_card_bottom_line"]];
            [self addSubview:divideView];
            [self.dividerViews addObject:divideView];
        }
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (UIButton *)setUpButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizeImageWithName:highlightedImageName] forState:UIControlStateHighlighted];
    btn.adjustsImageWhenHighlighted = NO;
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / self.btns.count;
    CGFloat btnH = self.frame.size.height;
    CGFloat dividerW = 2;
    
    for (int i = 0; i < self.btns.count; i ++) {
        CGFloat btnX = i * (btnW + dividerW);
        [self.btns[i] setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    }
    
    CGFloat dividerY = 0;
    
    for (int j = 0; j < self.dividerViews.count; j ++) {
        CGFloat dividerX = btnW * (j + 1) + dividerW * j;
        [self.dividerViews[j] setFrame:CGRectMake(dividerX, dividerY, dividerW, btnH)];
    }
}

- (void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    self.frame = statusFrame.bottomViewF;
    
    Status *status = statusFrame.status;

    [self setBtn:self.retweetedBtn withTitle:@"转发" count:status.reposts_count];
    [self setBtn:self.commentBtn withTitle:@"评论" count:status.comments_count];
    [self setBtn:self.attitudeBtn withTitle:@"赞" count:status.attitudes_count];
    
}

- (void)setBtn:(UIButton *)btn withTitle:(NSString *)originalTitle count:(int)count{
    
    NSString *title = originalTitle;
    if (count) {
        if (count < 10000) {
            title = [NSString stringWithFormat:@"%d",count];
        }else {
            title = [NSString stringWithFormat:@"%.1f万",count / 10000.0];
        }
    }
    
    [btn setTitle:title forState:UIControlStateNormal];
}

@end
