//
//  UIFont+Category.h
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Category)

/// 获取 系统 细 字体
+ (UIFont *)getSystemLightFont:(CGFloat)fontSize;

/// 获取 系统 中 字体
+ (UIFont *)getSystemRegularFont:(CGFloat)fontSize;

/// 获取 系统 粗 字体
+ (UIFont *)getSystemMediumFont:(CGFloat)fontSize;

/// 获取 系统 Bold 字体
+ (UIFont *)getSystemBoldFont:(CGFloat)fontSize;

/// 获取 系统 Semibold 字体
+ (UIFont *)getSystemSemiboldFont:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
