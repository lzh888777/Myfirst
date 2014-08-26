//
//  User.h
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *idstr;
/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  用户的头像
 */
@property (nonatomic, copy) NSString *profile_image_url;

@property (assign,nonatomic,getter = isVip)BOOL verified;

@end
