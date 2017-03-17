//
//  UIView+XMExtension.h
//  仿蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMExtension)

@property (assign, nonatomic) CGFloat xm_x;
@property (assign, nonatomic) CGFloat xm_y;
@property (assign, nonatomic) CGFloat xm_w;
@property (assign, nonatomic) CGFloat xm_h;
@property (assign, nonatomic) CGSize  xm_size;
@property (assign, nonatomic) CGPoint xm_origin;

@property (nonatomic, assign) CGFloat xm_endX;
@property (nonatomic, assign) CGFloat xm_endY;

@property (nonatomic, assign) CGFloat xm_centerX;
@property (nonatomic, assign) CGFloat xm_centerY;

@property (nonatomic, assign) CGFloat xm_originX;
@property (nonatomic, assign) CGFloat xm_originY;

@end
