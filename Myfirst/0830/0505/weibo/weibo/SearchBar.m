//
//  SearchBar.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "SearchBar.h"

@interface SearchBar ()



@end

@implementation SearchBar

+(instancetype)searchBar{
    return [[SearchBar alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background"];
       
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        icon.frame = CGRectMake(0, 0, 30, 30);
        icon.contentMode = UIViewContentModeCenter;
        self.leftView = icon;
        self.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        self.font = [UIFont systemFontOfSize:13];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
