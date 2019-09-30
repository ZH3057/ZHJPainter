//
//  UIViewController+Category.h
//  Category
//
//  Created by Jun Zhou on 2018/9/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

+ (UIViewController *)findTopViewController:(UIViewController *)controller;
+ (UIViewController *)currentViewController;

@end

@interface UIViewController (Life)

@end

@interface UIViewController (Gesture)

@property (nonatomic, assign) BOOL interactivePopDisabled;

@property (nonatomic, assign) BOOL prefersNavigationBarHidden;

@end
