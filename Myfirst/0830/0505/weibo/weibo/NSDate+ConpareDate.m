//
//  NSDate+ConpareDate.m
//  weibo
//
//  Created by 刘志华 on 14-8-25.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "NSDate+ConpareDate.h"

@implementation NSDate (ConpareDate)

- (BOOL)isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    int unit = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth;
    
    NSDateComponents *com = [calendar components:unit fromDate:self];
    NSDateComponents *nowCom = [calendar components:unit fromDate:now];
    
    return (com.year == nowCom.year)&&(com.month == nowCom.month)
    &&(com.day == nowCom.day);
}

- (BOOL)isYesterday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    int unit = NSCalendarUnitHour ;
    NSDateComponents *com = [calendar components:unit fromDate:now];
//    NSDateComponents *deltaCom = [self dalteTodate];
    int nowHour = com.hour;
    NSDate * addDate = [self dateByAddingTimeInterval:((24 + nowHour) * 60 * 60)];
    if ([addDate compare:now] == NSOrderedAscending) {
        return NO;
    }else{
        return YES;
    }
}

- (NSDateComponents *)dalteTodate{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    int unit =  NSCalendarUnitHour | NSCalendarUnitMinute;
    
    return [calendar components:unit fromDate:self toDate:now options:0];
}

- (BOOL)isThisYear{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    int unit = NSCalendarUnitYear;
    
    NSDateComponents *com = [calendar components:unit fromDate:self];
    NSDateComponents *nowCom = [calendar components:unit fromDate:now];
    
    return com.year == nowCom.year;
}

@end
