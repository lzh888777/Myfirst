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



+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (strong,nonatomic)StatusFrame *statusFrame;

@end
