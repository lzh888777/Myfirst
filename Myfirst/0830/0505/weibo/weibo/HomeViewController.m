//
//  HomeViewController.m
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+CustonItem.h"
#import "TitleImageButton.h"
#import "Status.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "AccountInfo.h"
#import "User.h"
#import "StatusFrame.h"
#import "StatusViewCell.h"

@interface HomeViewController ()

@property (strong,nonatomic)NSArray *statusFrames;

@end

@implementation HomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setUpNavigationItem];
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    AccountInfo *account = [AccountInfo account];
     NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"access_token"] = account.access_token;
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *statusesArray = [Status objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (Status *status in statusesArray) {
            StatusFrame *frame = [StatusFrame statusFrameWithStatus:status];
//            StatusFrame *frame = [[StatusFrame alloc]init];
//            frame.status = status;
            [statusFrames addObject:frame];
        }
        self.statusFrames = statusFrames;
            
            [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        IWLog(@"fail to send message");
    }];
    
}

- (void)setUpNavigationItem{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" target:self action:@selector(findFriend)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" target:self action:@selector(pop)];
    TitleImageButton *titleBtn = [TitleImageButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"好友动态" forState:UIControlStateNormal];
    [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    titleBtn.frame = CGRectMake(0, 0, 100, 30);
    self.navigationItem.titleView = titleBtn;
}

- (void)titleClick:(TitleImageButton *)button{
    
    if (button.isSelected) {
        [button setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        
    }else{
        
        [button setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
    button.selected = !button.isSelected;
}


- (void)pop{
    IWLog(@"pop");
}

- (void)findFriend{
    
    IWLog(@"findFriends");
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    StatusViewCell *cell = [StatusViewCell cellWithTableView:tableView];
    
    StatusFrame *frame = self.statusFrames[indexPath.row];
    cell.statusFrame = frame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusFrame *frame = self.statusFrames[indexPath.row];
    return frame.cellHight;
}

@end
