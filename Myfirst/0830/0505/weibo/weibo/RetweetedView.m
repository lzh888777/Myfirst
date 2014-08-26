//
//  RetweetedView.m
//  weibo
//
//  Created by 刘志华 on 14-8-26.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "RetweetedView.h"
#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "UIImageView+WebCache.h"

@interface RetweetedView ()

@property (nonatomic,weak) UILabel *retweeted_status_contentLabel;

@property (nonatomic,weak) UIImageView *retweeted_status_thumbnail_picView;

@end


@implementation RetweetedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.image = [UIImage resizeImageWithName:@"timeline_retweet_background"];
        self.highlightedImage = [UIImage resizeImageWithName:@"timeline_retweet_background_highlighted"];
        
        [self setUpRetweetedStatus];

    }
    return self;
}

- (void)setUpRetweetedStatus{
    
    UILabel *retweeted_status_contentLabel = [[UILabel alloc]init];
    
    UIImageView *retweeted_status_thumbnail_picView = [[UIImageView alloc]init];
    
    [self addSubview:retweeted_status_contentLabel];
    self.retweeted_status_contentLabel = retweeted_status_contentLabel;
    [self addSubview:retweeted_status_thumbnail_picView];
    self.retweeted_status_thumbnail_picView = retweeted_status_thumbnail_picView;
}

-(void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    
    Status *status = statusFrame.status;
    
    if (status.retweeted_status) {
        self.hidden = NO;
        self.frame = statusFrame.retweeted_statusF;
        self.retweeted_status_contentLabel.font = StatusNameFont;
        self.retweeted_status_contentLabel.numberOfLines = 0;
        self.retweeted_status_contentLabel.text = [NSString stringWithFormat:@"@%@:%@",status.retweeted_status.user.name,status.retweeted_status.text];
        self.retweeted_status_contentLabel.frame = statusFrame.retweeted_status_contentLabelF;
        
        if (status.retweeted_status.thumbnail_pic) {
            self.retweeted_status_thumbnail_picView.hidden = NO;
            self.retweeted_status_thumbnail_picView.frame = statusFrame.retweeted_status_thumbnail_picViewF;
            [self.retweeted_status_thumbnail_picView setImageWithURL:[NSURL URLWithString:status.retweeted_status.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"common_card_background"]];
        }else{
            self.retweeted_status_thumbnail_picView.hidden = YES;
        }
        
    }else{
        self.hidden = YES;
    }
    

}

@end
