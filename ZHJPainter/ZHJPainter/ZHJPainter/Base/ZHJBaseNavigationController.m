//
//  ZHJBaseNavigationController.m
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import "ZHJBaseNavigationController.h"

@interface ZHJBaseNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation ZHJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// !!!: 导航栏
    //[self.navigationBar setHidden:YES];
    /*
    self.delegate = self;
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    */
    
    /// !!!: 手势
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    UIPanGestureRecognizer * fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
    fullScreenGes.delegate = self;
    [targetView addGestureRecognizer:fullScreenGes];
    
    // 关闭边缘触发手势 防止和原有边缘手势冲突
    [self.interactivePopGestureRecognizer setEnabled:NO];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) return NO;
    
    // 过滤执行过渡动画时的手势处理
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) return NO;
    
    if (self.childViewControllers.count == 1) return NO;
    
    //UIViewController *topViewController = self.viewControllers.lastObject;
    if (self.topViewController.interactivePopDisabled) return NO;
    
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) viewController.hidesBottomBarWhenPushed = YES;
    
    if (![self.viewControllers containsObject:viewController]) {
        [super pushViewController:viewController animated:animated];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
     /// !!!: 设置导航栏影藏显示
    [self setNavigationBarHidden:viewController.prefersNavigationBarHidden animated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate {
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
