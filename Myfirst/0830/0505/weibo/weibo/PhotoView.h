//
//  PhotoView.h
//  weibo
//
//  Created by 刘志华 on 14-8-26.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusFrame;
@class Status;

@interface PhotoView : UIView

@property (strong,nonatomic)StatusFrame *statusFrame;

-(void)setPhotoViewWithStatusFrame:(StatusFrame *)statusFrame status:(Status *)status;

@end
