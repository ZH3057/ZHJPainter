//
//  UIView+Category.h
//  
//
//  Created by Jun on 2017/7/11.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

/** 返回View的 `x` */
@property (nonatomic, assign) CGFloat x;

/** 设置View的 `y` */
@property (nonatomic, assign) CGFloat y;

/** 设置View的 `width` */
@property (nonatomic, assign) CGFloat width;

/** 设置View的 `height` */
@property (nonatomic, assign) CGFloat height;

/** 设置View的 `origin` */
@property (nonatomic, assign) CGPoint origin;

/** 设置View的 `size` */
@property (nonatomic, assign) CGSize  size;

/** 设置View的 `y` */
@property (nonatomic, assign) CGFloat top;

/** 设置View的 `x` */
@property (nonatomic, assign) CGFloat left;

/** 设置View的 `y + height / MaxY` */
@property (nonatomic, assign) CGFloat bottom;

/** 设置View的 `x + width / MaxX` */
@property (nonatomic, assign) CGFloat right;

/** 设置View的 `center.x` */
@property (nonatomic, assign) CGFloat centerX;

/** 设置View的 `center.y` */
@property (nonatomic, assign) CGFloat centerY;

/** 返回基于屏幕坐标系 View的X */
@property (nonatomic, assign, readonly) CGFloat screenCoordinateX;

/** 返回基于屏幕坐标系 View的Y */
@property (nonatomic, assign, readonly) CGFloat screenCoordinateY;

/** 返回基于屏幕坐标系 View的Frame */
@property (nonatomic, assign, readonly) CGRect screenCoordinateFrame;


// MARK: -

- (void)setX:(CGFloat)x;
- (CGFloat)x;

- (void)setY:(CGFloat)y;
- (CGFloat)y;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setHeight:(CGFloat)height;
- (CGFloat)height;

- (void)setOrigin:(CGPoint)origin;
- (CGPoint)origin;

- (void)setSize:(CGSize)size;
- (CGSize)size;

- (void)setTop:(CGFloat)top;
- (CGFloat)top;

- (void)setLeft:(CGFloat)left;
- (CGFloat)left;

- (void)setBottom:(CGFloat)bottom;
- (CGFloat)bottom;

- (void)setRight:(CGFloat)right;
- (CGFloat)right;

- (void)setCenterX:(CGFloat)centerX;
- (CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;
- (CGFloat)centerY;

- (CGFloat)screenCoordinateX;

- (CGFloat)screenCoordinateY;

- (CGRect)screenCoordinateFrame;

- (UIViewController *)viewController;

- (UIView *)subViewOfClassName:(NSString*)className;


@end


@interface UIView(Corner)

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
               boardColor:(UIColor *)boardColor
               boardWidth:(CGFloat)boardWidth;

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;


@end
