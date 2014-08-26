//
//  Status.m
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "Status.h"
#import "NSDate+ConpareDate.h"

@implementation Status

-(void)setSource:(NSString *)source{
    
    NSInteger loc = [source rangeOfString:@">"].location + 1;
    NSInteger length = [source rangeOfString:@"</"].location - loc;
    NSRange range = NSMakeRange(loc, length);
    _source = [NSString stringWithFormat:@"来自%@",[source substringWithRange:range]];
}

- (NSString *)created_at{
    NSDateFormatter *dft = [[NSDateFormatter alloc]init];
    dft.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *date = [dft dateFromString:_created_at];
    if (date.isToday) {
     if (date.dalteTodate.hour >= 1){
        return [NSString stringWithFormat:@"%d小时前",date.dalteTodate.hour];
     }
       else if (date.dalteTodate.minute>=1) {
           return [NSString stringWithFormat:@"%d分钟前",date.dalteTodate.minute];
           
        }else {
            return @"刚刚";
        }
    }else {
        if (date.isYesterday){
            dft.dateFormat = @"昨天 mm:ss";
        }else if(date.isThisYear){
            dft.dateFormat = @"mm-dd HH:mm";
        }else{
            dft.dateFormat = @"yyyy-mm-dd HH:mm";
        }
    
        return [dft stringFromDate:date];
    }
}





@end
