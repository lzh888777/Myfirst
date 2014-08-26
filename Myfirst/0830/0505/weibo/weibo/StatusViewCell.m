//
//  StatusViewCell.m
//  weibo
//
//  Created by 刘志华 on 14-8-24.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "StatusViewCell.h"
#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "UIImageView+WebCache.h"

@interface StatusViewCell()

@property (weak,nonatomic)UIView *dividerView;

@end

@implementation StatusViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    StatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[StatusViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;

}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.selectedBackgroundView = [[UIView alloc]init];
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        UIImageView *topView = [[UIImageView alloc]init];
        topView.image = [UIImage resizeImageWithName:@"common_card_top_background"];
        topView.highlightedImage = [UIImage resizeImageWithName:@"common_card_top_background_highlighted"];

        [self.contentView addSubview:topView];
        self.topView = topView;
        
        [self setUpUserInfo];
        
        
        UIImageView *retweeted_statusView = [[UIImageView alloc]init];
        retweeted_statusView.image = [UIImage resizeImageWithName:@"timeline_retweet_background"];
        retweeted_statusView.highlightedImage = [UIImage resizeImageWithName:@"timeline_retweet_background_highlighted"];
        [self.topView addSubview:retweeted_statusView];
        self.retweeted_statusView = retweeted_statusView;
        
        [self setUpRetweetedStatus];
       
        UIImageView *bottomView = [[UIImageView alloc]init];
        bottomView.image = [UIImage resizeImageWithName:@"common_card_bottom_background"];
        bottomView.highlightedImage = [UIImage resizeImageWithName:@"common_card_bottom_background_highlighted"];
        self.bottomView = bottomView;
        [self.contentView addSubview:bottomView];
        
        UIView * divider = [[UIView alloc]init];
        divider.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:divider];
        self.dividerView = divider;
    }
    return self;
}

- (void)setUpUserInfo{
    UILabel *textLabel = [[UILabel alloc]init];
    
    UIImageView *thumbnail_picView = [[UIImageView alloc]init];
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
    
    [self.topView addSubview:profile_image_urlView];
    self.profile_image_urlView = profile_image_urlView;
    [self.topView addSubview:name];
    self.name = name;
    [self.topView addSubview:vipView];
    self.vipView = vipView;
    [self.topView addSubview:created_at];
    self.created_at = created_at;
    [self.topView addSubview:source];
    self.source = source;
    [self.topView addSubview:textLabel];
    self.statusTextLabel = textLabel;
    [self.topView addSubview:thumbnail_picView];
    self.thumbnail_picView = thumbnail_picView;
}

- (void)setUpRetweetedStatus{
    
    UILabel *retweeted_status_contentLabel = [[UILabel alloc]init];
    
    UIImageView *retweeted_status_thumbnail_picView = [[UIImageView alloc]init];
    
    [self.retweeted_statusView addSubview:retweeted_status_contentLabel];
    self.retweeted_status_contentLabel = retweeted_status_contentLabel;
    [self.retweeted_statusView addSubview:retweeted_status_thumbnail_picView];
    self.retweeted_status_thumbnail_picView = retweeted_status_thumbnail_picView;
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = StatusCellMargin;
    frame.origin.y += StatusCellMargin;
    frame.size.height -= 2* StatusCellMargin;
    frame.size.width -= 2* StatusCellMargin;
    
    [super setFrame:frame];
}

- (void)setStatusFrame:(StatusFrame *)statusFrame{
    
//    self.dividerView.frame = CGRectMake(0, 0, self.frame.size.width, 5);
    
    
    _statusFrame = statusFrame;
    self.topView.frame = statusFrame.topViewF;
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
    
    if (status.thumbnail_pic) {
        self.thumbnail_picView.hidden = NO;
        self.thumbnail_picView.frame = statusFrame.thumbnail_picF;
        [self.thumbnail_picView setImageWithURL:[NSURL URLWithString:status.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"common_card_background"]];
    }else{
        [self.thumbnail_picView setHidden:YES];
    }
        if (status.retweeted_status) {
            self.retweeted_statusView.hidden = NO;
            self.retweeted_statusView.frame = statusFrame.retweeted_statusF;
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
            self.retweeted_statusView.hidden = YES;
        }
    self.bottomView.frame = statusFrame.bottomViewF;
    
    
}


@end
