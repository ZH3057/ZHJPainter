//
//  UIFont+Category.m
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import "UIFont+Category.h"

@implementation UIFont (Category)

+ (BOOL)canUseFontSizeWithWeightMethod {
    return [self respondsToSelector:@selector(systemFontOfSize:weight:)];
}

/// 获取不到指定的字体 使用系统默认
+ (UIFont *)p_safeFontWithName:(NSString *)name fontSize:(CGFloat)fontSize {
    UIFont *font = [UIFont fontWithName:name size:fontSize];
    return font?font:[UIFont systemFontOfSize:fontSize];
}

// MARK: - 获取 系统 细 字体
+ (UIFont *)getSystemLightFont:(CGFloat)fontSize {
    if ([self canUseFontSizeWithWeightMethod]) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightLight];
    }
    return [self p_safeFontWithName:@"PingFangSC-Light" fontSize:fontSize];
}

// MARK: - 获取 系统 中 字体

+ (UIFont *)getSystemRegularFont:(CGFloat)fontSize {
    if ([self canUseFontSizeWithWeightMethod]) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
    }
    
    return [self p_safeFontWithName:@"PingFangSC-Regular" fontSize:fontSize];
}

// MARK: - 获取 系统 粗 字体

+ (UIFont *)getSystemMediumFont:(CGFloat)fontSize {
    if ([self canUseFontSizeWithWeightMethod]) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];
    }
    return [self p_safeFontWithName:@"PingFangSC-Medium" fontSize:fontSize];
}

// MARK: - 获取 系统 Bold 字体

+ (UIFont *)getSystemBoldFont:(CGFloat)fontSize {
    if ([self canUseFontSizeWithWeightMethod]) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBold];
    }
    return [self p_safeFontWithName:@"PingFangSC-Bold" fontSize:fontSize];
}

// MARK: - 获取 系统 Semibold 字体

+ (UIFont *)getSystemSemiboldFont:(CGFloat)fontSize {
    if ([self canUseFontSizeWithWeightMethod]) {
        return [UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold];
    }
    return [self p_safeFontWithName:@"PingFangSC-Semibold" fontSize:fontSize];
}

@end
