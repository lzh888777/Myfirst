//
//  StatusViewCell.m
//  weibo
//
//  Created by 刘志华 on 14-8-24.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "StatusViewCell.h"
#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "UIImageView+WebCache.h"
#import "BottomView.h"

#import "TopView.h"

@interface StatusViewCell()

@property (weak,nonatomic) TopView *topView;

@property (nonatomic,weak) BottomView *bottomView;


@end

@implementation StatusViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    StatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[StatusViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.selectedBackgroundView = [[UIView alloc]init];
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        TopView *topView = [[TopView alloc]init];
        [self.contentView addSubview:topView];
        self.topView = topView;
        
               
        BottomView *bottonView = [[BottomView alloc]init];
        self.bottomView = bottonView;
        [self.contentView addSubview:bottonView];
        
        
    }
    return self;
}





- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = StatusCellMargin;
    frame.origin.y += StatusCellMargin;
    frame.size.height -= 2* StatusCellMargin;
    frame.size.width -= 2* StatusCellMargin;
    
    [super setFrame:frame];
}

- (void)setStatusFrame:(StatusFrame *)statusFrame{
    
    _statusFrame = statusFrame;
    self.bottomView.statusFrame = statusFrame;
    self.topView.statusFrame = statusFrame;
}


@end
