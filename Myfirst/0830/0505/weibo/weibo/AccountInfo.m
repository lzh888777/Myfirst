//
//  AccountInfo.m
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "AccountInfo.h"
#define AccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountInfo

+ (instancetype)accountWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSDate *now = [NSDate date];
        NSDate *expiresTime = [now dateByAddingTimeInterval:[self.expires_in longLongValue]];
        self.expiresTime = expiresTime;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.access_token = [coder decodeObjectForKey:@"access_token"];
        self.expires_in = [coder decodeObjectForKey:@"expires_in"];
        self.remind_in = [coder decodeObjectForKey:@"remind_in"];
        self.uid = [coder decodeObjectForKey:@"uid"];
        self.expiresTime = [coder decodeObjectForKey:@"expiresTime"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in  forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expiresTime forKey:@"expiresTime"];
}

+(instancetype)account{
    AccountInfo *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    NSDate *now = [NSDate date];
    if ([now compare:account.expiresTime] == NSOrderedAscending) {
        return account;
    }else{
        return nil;
    }
}

- (void)saveAccount{
    [NSKeyedArchiver archiveRootObject:self toFile:AccountPath];
}

@end
