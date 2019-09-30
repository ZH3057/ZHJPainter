//
//  UIViewController+Category.m
//  Category
//
//  Created by Jun Zhou on 2018/9/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

@implementation UIViewController (Category)

+ (UIViewController *)findTopViewController:(UIViewController *)controller {
    
    if (controller.presentedViewController) {
        
        return [UIViewController findTopViewController:controller.presentedViewController];
    } else if ([controller isKindOfClass:[UISplitViewController class]]) {
        
        UISplitViewController *svc = (UISplitViewController*)controller;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findTopViewController:svc.viewControllers.lastObject];
        } else {
            return controller;
        }
        
    } else if ([controller isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *navigation = (UINavigationController*)controller;
        if (navigation.viewControllers.count > 0) {
            return [UIViewController findTopViewController:navigation.topViewController];
        } else {
            return controller;
        }
    } else if ([controller isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabcontroller = (UITabBarController*)controller;
        if (tabcontroller.viewControllers.count > 0) {
            return [UIViewController findTopViewController:tabcontroller.selectedViewController];
        } else {
            return controller;
        }
    } else {
        return controller;
    }
}

+ (UIViewController *)currentViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findTopViewController:viewController];
}

@end

@implementation UIViewController (Life)

#if DEBUG 

+ (void)load {
    
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method p_viewDidLoad = class_getInstanceMethod(self, @selector(p_viewDidLoad));
    method_exchangeImplementations(viewDidLoad, p_viewDidLoad);
    
    /*
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method p_viewWillAppear = class_getInstanceMethod(self, @selector(p_viewWillAppear:));
    method_exchangeImplementations(viewWillAppear, p_viewWillAppear);
    
    
    Method loadView = class_getInstanceMethod(self, @selector(loadView));
    Method p_loadView = class_getInstanceMethod(self, @selector(p_loadView));
    method_exchangeImplementations(loadView, p_loadView);
    
    
    
    
    
    Method viewDidAppear = class_getInstanceMethod(self, @selector(viewDidAppear:));
    Method p_viewDidAppear = class_getInstanceMethod(self, @selector(p_viewDidAppear:));
    method_exchangeImplementations(viewDidAppear, p_viewDidAppear);
    
    Method viewWillDisappear = class_getInstanceMethod(self, @selector(viewWillDisappear:));
    Method p_viewWillDisappear = class_getInstanceMethod(self, @selector(p_viewWillDisappear:));
    method_exchangeImplementations(viewWillDisappear, p_viewWillDisappear);
    
    Method viewDidDisappear = class_getInstanceMethod(self, @selector(viewDidDisappear:));
    Method p_viewDidDisappear = class_getInstanceMethod(self, @selector(p_viewDidDisappear:));
    method_exchangeImplementations(viewDidDisappear, p_viewDidDisappear);
    */
    
    Method oriMethod = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
    Method repMethod = class_getInstanceMethod(self, @selector(p_delloc));
    method_exchangeImplementations(oriMethod, repMethod);
}



- (void)p_loadView {
    NSLog(@"%@ loadView", self);
    [self p_loadView];
}

- (void)p_viewDidLoad {
    
    NSString *classString = NSStringFromClass(self.class);
    if (![classString isEqualToString:@"BTGBaseViewController"]) {
        NSLog(@"✅%@ viewDidLoad", self);
    }
    [self p_viewDidLoad];
}

- (void)p_viewWillAppear:(BOOL)animated {
    NSLog(@"%@ viewWillAppear", self);
    [self p_viewWillAppear:animated];
}

- (void)p_viewDidAppear:(BOOL)animated {
    NSLog(@"%@ viewDidAppear", self);
    [self p_viewDidAppear:animated];
}

- (void)p_viewWillDisappear:(BOOL)animated {
    NSLog(@"%@ viewWillDisappear", self);
    [self p_viewWillDisappear:animated];
}

- (void)p_viewDidDisappear:(BOOL)animated {
    NSLog(@"%@ viewDidDisappear", self);
    [self p_viewDidDisappear:animated];
}

- (void)p_delloc {
    NSString *classString = NSStringFromClass(self.class);
    if (![classString isEqualToString:@"BTGBaseViewController"]) {
        NSLog(@"❌%@ delloc", self.class);
    }
    [self p_delloc];
}

#endif

@end


@implementation UIViewController (Gesture)

- (BOOL)interactivePopDisabled {
    NSNumber *interactivePopDisabled = objc_getAssociatedObject(self, @selector(interactivePopDisabled));
    return interactivePopDisabled.boolValue;
}

- (void)setInteractivePopDisabled:(BOOL)interactivePopDisabled {
    objc_setAssociatedObject(self, @selector(interactivePopDisabled), @(interactivePopDisabled), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)prefersNavigationBarHidden {
    NSNumber *prefersNavigationBarHidden = objc_getAssociatedObject(self, @selector(prefersNavigationBarHidden));
    return prefersNavigationBarHidden.boolValue;
}

- (void)setPrefersNavigationBarHidden:(BOOL)prefersNavigationBarHidden {
    objc_setAssociatedObject(self, @selector(prefersNavigationBarHidden), @(prefersNavigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}

@end
