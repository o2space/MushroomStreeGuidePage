//
//  macros.h
//  仿蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#ifndef macros_h
#define macros_h

#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

#define XMUIColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define XMUIColorHexInt(hexValue) XMUIColor(((CGFloat)((hexValue & 0xFF0000) >> 16)),((CGFloat)((hexValue & 0xFF00) >> 8)),((CGFloat)(hexValue & 0xFF)),1.0)

#endif /* macros_h */
