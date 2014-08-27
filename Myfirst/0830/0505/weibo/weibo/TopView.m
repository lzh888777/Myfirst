//
//  TopView.m
//  weibo
//
//  Created by 刘志华 on 14-8-26.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "TopView.h"
#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "RetweetedView.h"
#import "UIImageView+WebCache.h"
#import "Photo.h"
#import "PhotoView.h"

@interface TopView ()

@property (nonatomic, weak) PhotoView *photoView;
/**
 *  微博的来源
 */

@property (nonatomic,weak) RetweetedView *retweeted_statusView;

@property (nonatomic,weak) UILabel *statusTextLabel;

@property (nonatomic, weak) UILabel *name;
/**
 *  用户的头像
 */
@property (nonatomic, weak) UIImageView *profile_image_urlView;

@property (weak,nonatomic)UIImageView *vipView;

@property (weak,nonatomic)UILabel *source;

@property (nonatomic,weak) UILabel *created_at;

@end

@implementation TopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage resizeImageWithName:@"common_card_top_background"];
        self.highlightedImage = [UIImage resizeImageWithName:@"common_card_top_background_highlighted"];
        
        RetweetedView *retweeted_statusView = [[RetweetedView alloc]init];
        [self addSubview:retweeted_statusView];
        self.retweeted_statusView = retweeted_statusView;
        [self setUpUserInfo];
        
    }
    return self;
}

- (void)setUpUserInfo{
    UILabel *textLabel = [[UILabel alloc]init];
    
    PhotoView *photoView = [[PhotoView alloc]init];
    /**
     *  微博的来源
     */
    
    UILabel *name = [[UILabel alloc]init];
    /**
     *  用户的头像
     */
    UIImageView *profile_image_urlView = [[UIImageView alloc]init];
    
    UIImageView *vipView = [[UIImageView alloc]init];
    
    UILabel *source = [[UILabel alloc]init];
    
    UILabel *created_at = [[UILabel alloc]init];
    created_at.textColor = [UIColor orangeColor];
    
    [self addSubview:profile_image_urlView];
    self.profile_image_urlView = profile_image_urlView;
    [self addSubview:name];
    self.name = name;
    [self addSubview:vipView];
    self.vipView = vipView;
    [self addSubview:created_at];
    self.created_at = created_at;
    [self addSubview:source];
    self.source = source;
    [self addSubview:textLabel];
    self.statusTextLabel = textLabel;
    [self addSubview:photoView];
    self.photoView = photoView;
}

- (void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    
    self.frame = statusFrame.topViewF;
    Status *status = statusFrame.status;
    User *user = status.user;
    [self.profile_image_urlView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    self.profile_image_urlView.frame = statusFrame.profile_imageF;
    
    self.name.text = user.name;
    self.name.font = StatusNameFont;
    self.name.frame = statusFrame.nameF;
    //    self.vipView.hidden = NO;
    //    self.thumbnail_picView.hidden = NO;
    //    self.retweeted_status_thumbnail_picView.hidden = NO;
    
    if (user.isVip) {
        self.vipView.hidden = NO;
        self.name.textColor = [UIColor orangeColor];
        self.vipView.frame = statusFrame.vipF;
        [self.vipView setContentMode:UIViewContentModeCenter];
        self.vipView.image = [UIImage imageWithName:@"common_icon_membership"];
        
    }else{
        self.name.textColor = [UIColor blackColor];
        self.vipView.hidden =YES;
    }
    
    self.created_at.frame = statusFrame.created_atF;
    self.created_at.text = status.created_at;
    self.created_at.font = StatusTimeFont;
    
    self.source.text = status.source;
    self.source.font = StatusTimeFont;
    self.source.frame = statusFrame.sourceF;
    
    self.statusTextLabel.text = status.text;
    self.statusTextLabel.font = StatusTextFont;
    self.statusTextLabel.numberOfLines = 0;
    self.statusTextLabel.frame = statusFrame.textF;
    
    if (status.pic_urls.count) {
        self.photoView.hidden = NO;
        self.photoView.frame = statusFrame.photoViewF;
        [self.photoView setPhotoViewWithStatusFrame:statusFrame status:status];
        
        
    }else{
        [self.photoView setHidden:YES];
    }
    
    self.retweeted_statusView.statusFrame = statusFrame;
}

@end
