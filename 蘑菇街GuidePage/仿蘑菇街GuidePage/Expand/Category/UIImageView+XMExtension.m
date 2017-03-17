//
//  UIImageView+XMExtension.m
//  仿蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#import "UIImageView+XMExtension.h"

@implementation UIImageView (XMExtension)

+ (UIImageView *)imageViewWithName:(NSString *)name{
    UIImage *img = [UIImage imageNamed:name];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.clipsToBounds = YES;
    CGRect frame = CGRectMake(0, 0, img.size.width, img.size.height);
    imgView.frame = frame;
    return imgView;
}

@end
