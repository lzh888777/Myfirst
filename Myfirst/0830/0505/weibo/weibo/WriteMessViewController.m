//
//  WriteMessViewController.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "WriteMessViewController.h"


@interface WriteMessViewController ()

@end

@implementation WriteMessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"写信息";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToTabBarCv)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendMess)];
    
}

- (void)backToTabBarCv{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendMess{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
