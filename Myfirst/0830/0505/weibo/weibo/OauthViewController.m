//
//  OauthViewController.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "OauthViewController.h"
#import "AFNetworking.h"
#import "MyTool.h"
#import "MBProgressHUD+MJ.h"
#import "AccountInfo.h"

@interface OauthViewController ()<UIWebViewDelegate>

@end

@implementation OauthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.frame;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3397732220&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlStr = request.URL.absoluteString;
    NSRange range =[urlStr rangeOfString:@"code="];
    if (range.location != NSNotFound) {
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        [self accessTokenWithCode:code];
            }
    return  YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载中、、、、"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}

- (void)accessTokenWithCode:(NSString *)code{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"3397732220";
    params[@"client_secret"] = @"6a6c21120c3eb2049d5a84b0e0df9380";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        AccountInfo *account = [AccountInfo accountWithDict:responseObject];
        [account saveAccount];
        
        [MBProgressHUD hideHUD];
        [MyTool chooseRootController];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"send error %@",error);
    }];

}


@end
