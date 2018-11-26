//
//  NSDate+ConpareDate.h
//  weibo
//
//  Created by 刘志华 on 14-8-25.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ConpareDate)

- (BOOL)isToday;

- (BOOL)isYesterday;

- (BOOL)isThisYear;

-(NSDateComponents *)dalteTodate;

@end
