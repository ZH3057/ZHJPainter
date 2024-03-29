//
//  UIColor+Category.h
//  
//
//  Created by Jun on 2017/7/21.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/** 主题色 */
+ (UIColor *)themeColor;

/** 全局灰色 */
+ (UIColor *)globalGrayColor;

+ (UIColor *)lineColor;

+ (UIColor *)randomColor;

+ (UIColor *)colorWithRangeIn255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)colorWithRangeIn255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 * 从十六进制字符串获取颜色，
 * color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */

+ (UIColor *)colorWithHex:(NSInteger)hexValue;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (NSString *)hexFromUIColor:(UIColor *)color;

@end

