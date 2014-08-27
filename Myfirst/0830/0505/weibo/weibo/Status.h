//
//  Status.h
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject

@property (nonatomic, copy) NSString *text;

//@property (nonatomic, copy) NSString *thumbnail_pic;

@property (nonatomic,strong) NSArray *pic_urls;

/**
 *  微博的来源
 */

@property (copy,nonatomic)NSString *source;

@property (nonatomic,copy) NSString *created_at;
/**
 *  微博的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  微博的转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  微博的评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  微博的评论数
 */
@property (nonatomic, assign) int attitudes_count;
/**
 *  微博的作者
 */
@property (nonatomic, strong) User *user;

@property (nonatomic,strong) Status *retweeted_status;

@end
