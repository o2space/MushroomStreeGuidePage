//
//  UIView+XMExtension.m
//  仿蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#import "UIView+XMExtension.h"

@implementation UIView (XMExtension)

- (void)setXm_x:(CGFloat)xm_x
{
    CGRect frame = self.frame;
    frame.origin.x = xm_x;
    self.frame = frame;
}

- (CGFloat)xm_x
{
    return self.frame.origin.x;
}

- (void)setXm_y:(CGFloat)xm_y
{
    CGRect frame = self.frame;
    frame.origin.y = xm_y;
    self.frame = frame;
}

- (CGFloat)xm_y
{
    return self.frame.origin.y;
}

- (void)setXm_w:(CGFloat)xm_w
{
    CGRect frame = self.frame;
    frame.size.width = xm_w;
    self.frame = frame;
}

- (CGFloat)xm_w
{
    return self.frame.size.width;
}

- (void)setXm_h:(CGFloat)xm_h
{
    CGRect frame = self.frame;
    frame.size.height = xm_h;
    self.frame = frame;
}

- (CGFloat)xm_h
{
    return self.frame.size.height;
}

- (void)setXm_size:(CGSize)xm_size
{
    CGRect frame = self.frame;
    frame.size = xm_size;
    self.frame = frame;
}

- (CGSize)xm_size
{
    return self.frame.size;
}

- (void)setXm_origin:(CGPoint)xm_origin
{
    CGRect frame = self.frame;
    frame.origin = xm_origin;
    self.frame = frame;
}

- (CGPoint)xm_origin
{
    return self.frame.origin;
}

-(void)setXm_endX:(CGFloat)xm_endX{
    
    CGRect frame = self.frame;
    frame.origin.x = xm_endX - self.xm_w;
    self.frame = frame;
}

-(CGFloat)xm_endX{
    return self.xm_origin.x+ self.xm_w;
}

-(void)setXm_endY:(CGFloat)xm_endY{
    
    CGRect frame = self.frame;
    frame.origin.y = xm_endY - self.xm_h;
    self.frame = frame;
}

-(CGFloat)xm_endY{
    return self.xm_origin.y + self.xm_h;
}

-(void)setXm_centerX:(CGFloat)xm_centerX{
    
    CGRect frame = self.frame;
    frame.origin.x = xm_centerX - self.xm_w/2;
    self.frame = frame;
}

-(CGFloat)xm_centerX{
    
    return (self.frame.origin.x+self.bounds.size.width/2);
}

-(void)setXm_centerY:(CGFloat)xm_centerY{
    
    CGRect frame = self.frame;
    frame.origin.y = xm_centerY - self.xm_h/2;
    self.frame = frame;
}

-(CGFloat)xm_centerY{
    return (self.frame.origin.y+self.bounds.size.height/2);
}

-(void)setXm_originX:(CGFloat)xm_originX{
    
    CGRect frame = self.frame;
    frame.origin.x = xm_originX;
    self.frame = frame;
}

-(CGFloat)xm_originX{
    return self.frame.origin.x;
}

-(void)setXm_originY:(CGFloat)xm_originY{
    
    CGRect frame = self.frame;
    frame.origin.y = xm_originY;
    self.frame = frame;
}

-(CGFloat)xm_originY{
    return self.frame.origin.y;
}

@end
