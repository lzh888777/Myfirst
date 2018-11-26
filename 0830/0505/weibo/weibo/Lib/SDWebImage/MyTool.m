//
//  MyTool.m
//  weibo
//
//  Created by 刘志华 on 14-8-23.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "MyTool.h"
#import "AccountInfo.h"
#import "OauthViewController.h"
#import "TabBarViewController.h"
#import "NewFeatureController.h"

@implementation MyTool

+ (void)chooseRootController{

    AccountInfo *acc = [AccountInfo account];
    if (acc == nil) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[OauthViewController alloc]init];
    }else{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [defaults stringForKey:@"lastVersion"];
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
        UIApplication *application = [UIApplication sharedApplication];
        if ([currentVersion isEqualToString:lastVersion]) {
            application.statusBarHidden = NO;
            application.keyWindow.rootViewController = [[TabBarViewController alloc]init];
            
        }else{
            [defaults setObject:currentVersion forKey:@"lastVersion"];
            [defaults synchronize];
            
            application.keyWindow.rootViewController = [[NewFeatureController alloc]init];
        }
    }
}

@end
