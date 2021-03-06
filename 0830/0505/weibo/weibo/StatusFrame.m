//
//  StatusFrame.m
//  weibo
//
//  Created by 刘志华 on 14-8-24.
//  Copyright (c) 2014年 刘志华. All rights reserved.
//

#import "StatusFrame.h"
#import "User.h"
#import "Status.h"

#define StatusCellBorder 5

@implementation StatusFrame

+ (instancetype)statusFrameWithStatus:(Status *)status{
    StatusFrame *frame = [[StatusFrame alloc]init];
    frame.status = status;
    
    return frame;
}


- (void)setStatus:(Status *)status{
    _status = status;
    
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2*StatusCellMargin;
    
    CGFloat topViewW = cellW;
    CGFloat topviewH = 0;
    CGFloat topviewX = 0;
    CGFloat topviewY = 0;
    
    CGFloat bottomViewX = topviewX;
    CGFloat bottomViewY = 0;
    CGFloat bottomViewW = topViewW - StatusCellMargin;
    CGFloat bottomViewH = 35;
    
    CGFloat iconViewWH = 35;
    CGFloat iconViewX = StatusCellBorder;
    CGFloat iconViewY = StatusCellBorder;
    _profile_imageF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    
    CGFloat nameX = CGRectGetMaxX(_profile_imageF) + StatusCellBorder;
    CGFloat nameY = StatusCellBorder;
    CGSize nameSize = [status.user.name sizeWithFont:StatusNameFont];
    _nameF = (CGRect){{nameX,nameY},nameSize};
    
    if (status.user.isVip) {
        CGFloat vipX = CGRectGetMaxX(_nameF) + StatusCellBorder;
        CGFloat vipY = StatusCellBorder;
        CGFloat vipW = 14;
        CGFloat vipH = _nameF.size.height;
        _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    
    _created_atF = self.created_atF;
    
    
    _sourceF = self.sourceF;
    
    CGFloat textX = iconViewX;
    CGFloat textY = MAX(CGRectGetMaxY(_created_atF), CGRectGetMaxY(_profile_imageF)) + StatusCellBorder;
    CGSize textSize = [status.text sizeWithFont:StatusTextFont constrainedToSize:CGSizeMake(cellW -2*StatusCellBorder , MAXFLOAT)];
    _textF = (CGRect){{textX,textY},textSize};
    
    topviewH = CGRectGetMaxY(_textF);
    
    
    if (status.pic_urls.count) {
        CGFloat photoViewX = textX;
        CGFloat photoViewY = CGRectGetMaxY(_textF) + StatusCellBorder;
        CGFloat photoViewW = self.textF.size.width - StatusCellBorder;
        CGFloat photoViewH = PhotoViewWH * ((status.pic_urls.count - 1) / 3 + 1);
        _photoViewF = CGRectMake(photoViewX, photoViewY, photoViewW, photoViewH);
        topviewH = CGRectGetMaxY(_photoViewF);
    }else{
        
        if (status.retweeted_status) {
            CGFloat retweetViewW = cellW - 2 * StatusCellBorder;
            CGFloat retweetViewX = textX;
            CGFloat retweetViewY = CGRectGetMaxY(_textF) + StatusCellBorder;
            CGFloat retweetViewH = 0;
            
            CGFloat retweenContentViewX = 2 * StatusCellBorder;
            CGFloat retweenContentViewY = StatusCellBorder;
            NSString *content = [NSString stringWithFormat:@"@%@:%@",status.retweeted_status.user.name,status.retweeted_status.text];
            CGSize retweenContentViewSize = [content sizeWithFont:StatusNameFont constrainedToSize:CGSizeMake(retweetViewW, MAXFLOAT)];
            _retweeted_status_contentLabelF = (CGRect){{retweenContentViewX - 2 * StatusCellBorder,retweenContentViewY},retweenContentViewSize};
            retweetViewH = CGRectGetMaxY(_retweeted_status_contentLabelF) + StatusCellBorder;
            
//            topviewH += CGRectGetMaxY(_retweeted_status_contentLabelF) ;
            
            if (status.retweeted_status.pic_urls.count) {
                CGFloat retweeted_status_photoViewX = retweenContentViewX;
                CGFloat retweeted_status_photoViewY = CGRectGetMaxY(_retweeted_status_contentLabelF) + StatusCellBorder;
                
                CGFloat retweeted_status_photoViewW = self.retweeted_status_contentLabelF.size.width - 2 * StatusCellBorder;
                CGFloat retweeted_status_photoViewH = PhotoViewWH * ((status.retweeted_status.pic_urls.count - 1) / 3 + 1);
                _retweeted_status_photoViewF = CGRectMake(retweeted_status_photoViewX, retweeted_status_photoViewY, retweeted_status_photoViewW, retweeted_status_photoViewH);
                

                
                retweetViewH = CGRectGetMaxY(_retweeted_status_photoViewF) + StatusCellBorder;
                
            }
            
            _retweeted_statusF = CGRectMake(retweetViewX, retweetViewY, retweetViewW, retweetViewH);
            topviewH = CGRectGetMaxY(_retweeted_statusF) ;
        }
 
    }

    bottomViewY = topviewH + StatusCellMargin;
    _bottomViewF = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);
    topviewH += bottomViewH+StatusCellMargin ;
    _topViewF = CGRectMake(topviewX, topviewY, topViewW, topviewH);
    _cellHight = topviewH + 2 *StatusCellMargin;
    
}

-(CGRect)created_atF{
    CGFloat creat_atX = _nameF.origin.x;
    CGFloat creat_atY = CGRectGetMaxY(_nameF) + StatusCellBorder;
    CGSize creat_atSize = [self.status.created_at sizeWithFont:StatusTimeFont];
    return (CGRect){{creat_atX,creat_atY},creat_atSize};
}

- (CGRect)sourceF{
    CGFloat sourceX = CGRectGetMaxX(_created_atF) + StatusCellBorder;
    CGFloat sourceY = _created_atF.origin.y ;
    CGSize sourceSize = [self.status.source sizeWithFont:StatusTimeFont];
    return (CGRect){{sourceX,sourceY},sourceSize};
}

@end
