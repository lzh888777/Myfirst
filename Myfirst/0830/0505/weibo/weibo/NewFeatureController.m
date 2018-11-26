//
//  NewFeatureController.m
//  weibo
//
//  Created by 刘志华 on 14-8-22.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "NewFeatureController.h"
#import "TabBarViewController.h"


@interface NewFeatureController ()<UIScrollViewDelegate>

@property (strong,nonatomic)UIPageControl *pageControl;

@end

@implementation NewFeatureController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = Color(246, 246, 248);
    [self setUpScrollView];
    [self setUpPageControl];
    
}

- (void)setUpPageControl{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = 3;
    pageControl.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height - 30);
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)setUpScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    for (int i = 0; i < 3; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        [scrollView addSubview:imageView];
        CGFloat imageX = i * imageW;
        UIImage *image = [UIImage imageWithName:imageName];
        imageView.image = image;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
        if (i == 2) {
            [self setUpLastImageView:imageView];
        }
    }
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(3*self.view.bounds.size.width, self.view.bounds.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
}

- (void)setUpLastImageView:(UIImageView *)imageView{
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageView.userInteractionEnabled = YES;
    [startBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.center = CGPointMake(imageView.frame.size.width * 0.5, imageView.frame.size.height*0.6);
    [startBtn setTitle:@"开始体验" forState:UIControlStateNormal] ;
    
    startBtn.bounds = (CGRect){CGPointZero,startBtn.currentBackgroundImage.size};
    [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    checkbox.titleLabel.font = [UIFont systemFontOfSize:14];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [checkbox setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    checkbox.selected = YES;
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    checkbox.bounds = startBtn.bounds;
    checkbox.center = CGPointMake(imageView.frame.size.width * 0.5, imageView.frame.size.height*0.5);
    
    [imageView addSubview:checkbox];
}

- (void)startBtnClick{
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.view.window.rootViewController = [[TabBarViewController alloc]init];
}

- (void)checkboxClick:(UIButton *)button{
    button.selected = !button.isSelected;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;

    self.pageControl.currentPage = currentPage;
}



@end
