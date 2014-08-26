//
//  AccountInfo.h
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountInfo : NSObject <NSCoding>

@property (copy,nonatomic)NSString *access_token;
@property (copy,nonatomic)NSString *expires_in;
@property (copy,nonatomic)NSString *remind_in;
@property (copy,nonatomic)NSString *uid;
@property (strong,nonatomic)NSDate *expiresTime;

- (void)saveAccount;
+ (instancetype)account;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
