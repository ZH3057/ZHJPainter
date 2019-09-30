//
//  ZHJScreenFitUtil.m
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import "ZHJScreenFitUtil.h"

ScreenFitUtilStruct FitUtil;

static inline UIFont * screenFitFont(CGFloat fontSize);
static inline UIFont * screenFitBoldFont(CGFloat fontSize);
static inline UIFont * screenFitFontWithFontName(NSString *fontName, CGFloat fontSize);
static inline CGFloat screenFitFloat(CGFloat num);

__attribute__ ((constructor)) static void initialize_ScreenFitUtil () {
    
    FitUtil.isIPhone            = [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] || [[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"];
    FitUtil.isIPhoneX           = (FitUtil.isIPhone && CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size));
    FitUtil.isIPhoneXR          = (FitUtil.isIPhone && CGSizeEqualToSize(CGSizeMake(414, 896), [[UIScreen mainScreen] bounds].size));
    FitUtil.isIPhoneXS          = FitUtil.isIPhoneX; // size同iPhoneX
    FitUtil.isIPhoneXSMAX       = FitUtil.isIPhoneXR; // size同iPhoneXR
    FitUtil.isPad               = [[[UIDevice currentDevice] model] isEqualToString:@"iPad"];
    FitUtil.isIPhoneXSeries     = FitUtil.isIPhoneX || FitUtil.isIPhoneXR || FitUtil.isIPhoneXS || FitUtil.isIPhoneXSMAX;
    
    FitUtil.fitFont = screenFitFont;
    FitUtil.fitBoldFont = screenFitBoldFont;
    FitUtil.fitFontWithFontName = screenFitFontWithFontName;
    FitUtil.fitFloat = screenFitFloat;
    
    CGFloat screenWidth         = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight        = [UIScreen mainScreen].bounds.size.height;
    CGFloat shortSideLength     = MIN(screenWidth, screenHeight);
    FitUtil.fitScaleBaseIPhone6 = shortSideLength / 375.0;
    
    if (FitUtil.isIPhone) {
    
         switch ((NSInteger)shortSideLength) {
         
         case 320: {  /// 5/SE... 320
         FitUtil.fitScale            = 0.85;
         } break;
         
         case 375: {  /// 6/6s iPhoneX... 375 Base
         FitUtil.fitScale            = 1;
         } break;
         
         case 414: {  /// 6sPlus 7Plus 8Plus...  414
         FitUtil.fitScale            = 1.1;
         } break;
         
         default:
         FitUtil.fitScale            = 1;
         break;
         }
         
        /// !!!: 以iPhone6的尺寸为基准准
        FitUtil.fitScale = shortSideLength / 375.0;
        
    } else if (FitUtil.isPad) {
        
        /// !!!: iPad放大倍数1.5
        FitUtil.fitScale                    = 1.5;
        
    } else {
        FitUtil.fitScale                    = 1;
    }
}


static inline UIFont * screenFitFont(CGFloat fontSize) {
    return [UIFont systemFontOfSize:fontSize * FitUtil.fitScale];
}

static inline UIFont * screenFitBoldFont(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:fontSize * FitUtil.fitScale];
}

static inline UIFont * screenFitFontWithFontName(NSString *fontName, CGFloat fontSize) {
    return [UIFont fontWithName:fontName size:fontSize * FitUtil.fitScale];
}

static inline CGFloat screenFitFloat(CGFloat num) {
    return (num) * FitUtil.fitScale;
}

