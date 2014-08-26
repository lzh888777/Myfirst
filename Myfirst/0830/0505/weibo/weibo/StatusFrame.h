//
//  StatusFrame.h
//  weibo
//
//  Created by 刘志华 on 14-8-24.
//  assignright (c) 2014年 刘志华. All rights reserved.
//

#import <Foundation/Foundation.h>

#define StatusTextFont [UIFont systemFontOfSize:15]
#define StatusNameFont [UIFont systemFontOfSize:14]
#define StatusTimeFont [UIFont systemFontOfSize:12]

#define StatusCellMargin 5

@class Status;

@interface StatusFrame : NSObject

@property (nonatomic,assign)CGRect topViewF;

@property (nonatomic, assign) CGRect nameF;
/**
 *  用户的头像
 */
@property (nonatomic, assign) CGRect profile_imageF;

@property (assign,nonatomic) CGRect vipF;

@property (nonatomic, assign) CGRect textF;

@property (nonatomic, assign) CGRect thumbnail_picF;
/**
 *  微博的来源
 */
@property (nonatomic, assign) CGRect sourceF;

@property (nonatomic,assign) CGRect created_atF;



@property (nonatomic,assign) CGRect retweeted_statusF;

@property (nonatomic,assign) CGRect retweeted_status_contentLabelF;

@property (nonatomic,assign) CGRect retweeted_status_thumbnail_picViewF;

@property (nonatomic,assign) CGRect bottomViewF;
@property (assign,nonatomic)CGFloat cellHight;

@property (strong,nonatomic)Status *status;

+ (instancetype)statusFrameWithStatus:(Status *)status;

@end
