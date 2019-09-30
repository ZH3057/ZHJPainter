//
//  ZHJScreenFitUtil.h
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+Category.h"

typedef struct {
    
    BOOL isIPhone;
    BOOL isIPhoneX;
    BOOL isIPhoneXR;
    BOOL isIPhoneXS;
    BOOL isIPhoneXSMAX;
    BOOL isPad;
    BOOL isIPhoneXSeries;
    
    // 适配比例
    CGFloat fitScale;
    
    // 基于iPhone6的适配
    CGFloat fitScaleBaseIPhone6;
    
    // 适配font
    UIFont * (*fitFont)(CGFloat);
    
    // 适配粗体font
    UIFont * (*fitBoldFont)(CGFloat);
    
    // 适配特定字体font
    UIFont * (*fitFontWithFontName)(NSString *, CGFloat);
    
    // 适配float
    CGFloat (*fitFloat)(CGFloat);
    
} ScreenFitUtilStruct;

extern ScreenFitUtilStruct FitUtil;
