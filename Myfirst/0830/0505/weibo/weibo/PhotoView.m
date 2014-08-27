//
//  PhotoView.m
//  weibo
//
//  Created by 刘志华 on 14-8-26.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "PhotoView.h"
#import "Status.h"
#import "Photo.h"
#import "StatusFrame.h"
#import "UIImageView+WebCache.h"

@implementation PhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setPhotoViewWithStatusFrame:(StatusFrame *)statusFrame status:(Status *)status{

    _statusFrame = statusFrame;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (status.pic_urls.count == 4) {
        for (int i = 0; i < 4; i ++) {
            Photo *p = status.pic_urls[i];
            CGFloat imageViewX = (i % 2) * (PhotoViewWH + StatusCellMargin) ;
            CGFloat imageViewY = i / 2 * (PhotoViewWH + StatusCellMargin) ;
            CGRect imageViewFrame = CGRectMake(imageViewX, imageViewY, PhotoViewWH, PhotoViewWH);
            UIImageView * photoImageView = [[UIImageView alloc]initWithFrame:imageViewFrame];
            [photoImageView  setImageWithURL:[NSURL URLWithString:p.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"common_card_background"]];
            photoImageView.userInteractionEnabled = YES;
            [self addSubview:photoImageView];

        }
        
    }else{
        
    for (int i = 0; i < status.pic_urls.count; i ++) {
        Photo *p = status.pic_urls[i];
        CGFloat imageViewX = (i % 3) * (PhotoViewWH + StatusCellMargin);
        CGFloat imageViewY = i /3 * (PhotoViewWH + StatusCellMargin);
        CGRect imageViewFrame = CGRectMake(imageViewX, imageViewY, PhotoViewWH, PhotoViewWH);
        
        UIImageView *photoImageView = [[UIImageView alloc]initWithFrame:imageViewFrame];
    
        photoImageView.userInteractionEnabled = YES;
        [photoImageView  setImageWithURL:[NSURL URLWithString:p.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"common_card_background"]];
        
        [self addSubview:photoImageView];
        
        }
    }
}

@end
