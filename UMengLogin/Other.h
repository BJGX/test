//
//  Other.h
//  iOSProject
//
//  Created by LangLang on 16/10/12.
//  Copyright © 2016年 LangLang. All rights reserved.
//

#ifndef Other_h
#define Other_h


#endif /* Other_h */
/**
 *  app名字
 */
#define ThemTitle @"服装"
/**
 *  尺寸
 *
 */
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define MAXX_ CGRectGetWidth([UIScreen mainScreen].bounds)
#define MAXY_ CGRectGetHeight([UIScreen mainScreen].bounds)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define _Property  @property (nonatomic ,strong)

/**
 *  颜色
 */
#import "UIColor+LLColor.h"

/*! 主色 */
#define L333333 [UIColor colorWithHexString:@"#333333"] 
#define L666666 [UIColor colorWithHexString:@"#666666"]
#define L999999 [UIColor colorWithHexString:@"#999999"]
#define Lffffff [UIColor colorWithHexString:@"#ffffff"]
#define Lf5f5f5 [UIColor colorWithHexString:@"#f5f5f5"]
#define Ldddddd [UIColor colorWithHexString:@"#dddddd"]
#define Lc00000 [UIColor colorWithHexString:@"#c00000"]
#define L000000 [UIColor colorWithHexString:@"#000000"]













