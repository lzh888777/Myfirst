//
//  UIImage+loadImage.m
//  weibo
//
//  Created by 刘志华 on 14-8-21.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "UIImage+loadImage.h"

@implementation UIImage (loadImage)

+ (UIImage *)imageWithName:(NSString *)name{
    
    if (ios7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        
        if (image == nil) {
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    
    return [UIImage imageNamed:name];
}

+(UIImage *)resizeImageWithName:(NSString *)name{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width *0.8 topCapHeight:image.size.height *0.5];
}


@end
