//
//  StatusViewCell.h
//  weibo
//
//  Created by 刘志华 on 14-8-24.
//  weakright (c) 2014年 刘志华. All rights reserved.
//

#import <UIKit/UIKit.h>


@class StatusFrame;
@interface StatusViewCell : UITableViewCell

@property (weak,nonatomic) UIImageView *topView;

@property (nonatomic, weak) UIImageView *thumbnail_picView;
/**
 *  微博的来源
 */

@property (nonatomic,weak) UILabel *statusTextLabel;

@property (nonatomic, weak) UILabel *name;
/**
 *  用户的头像
 */
@property (nonatomic, weak) UIImageView *profile_image_urlView;

@property (weak,nonatomic)UIImageView *vipView;

@property (weak,nonatomic)UILabel *source;

@property (nonatomic,weak) UILabel *created_at;
/**
 *  微博的ID
 */
//@property (nonatomic, weak) UILabel *idstr;
/**
 *  微博的转发数
 */
//@property (nonatomic, assign) int reposts_count;
/**
 *  微博的评论数
 */
//@property (nonatomic, assign) int comments_count;
/**
 *  微博的作者
 */


@property (nonatomic,weak) UIView *retweeted_statusView;

//@property (nonatomic,weak) UILabel *retweeted_status_nameLabel;

@property (nonatomic,weak) UILabel *retweeted_status_contentLabel;

@property (nonatomic,weak) UIImageView *retweeted_status_thumbnail_picView;

@property (nonatomic,weak) UIImageView *bottomView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (strong,nonatomic)StatusFrame *statusFrame;

@end
