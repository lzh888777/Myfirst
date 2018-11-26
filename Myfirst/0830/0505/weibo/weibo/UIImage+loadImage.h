//
//  UIImage+loadImage.h
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (loadImage)

+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)resizeImageWithName:(NSString*)name;

@end
