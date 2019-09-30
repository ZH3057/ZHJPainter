//
//  ZHJBaseViewController.m
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import "ZHJBaseViewController.h"

@interface ZHJBaseViewController ()

@property (nonatomic, strong, readwrite) UIView *safeAreaView;

@property (nonatomic, assign, readwrite) CGFloat safeAreaInsetsTop;

@property (nonatomic, assign, readwrite) CGFloat safeAreaInsetsLeft;

@property (nonatomic, assign, readwrite) CGFloat safeAreaInsetsRight;

@property (nonatomic, assign, readwrite) CGFloat safeAreaInsetsBottom;

@end

@implementation ZHJBaseViewController

// MARK: - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateSafeAreaViewFrame];
    [self configBaseUI];
    [self setupBaseSubviews];
}


// MARK: - Config UI

- (void)configBaseUI {
    self.view.backgroundColor = UIColor.whiteColor;
    
    if (@available(ios 11.0, *)) {
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}


// MARK: - Setup Subviews

- (void)setupBaseSubviews {
    [self.view addSubview:self.safeAreaView];
    self.safeAreaView.frame = self.view.bounds;
}




- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewSafeAreaInsetsDidChange {
    if (@available(iOS 11.0, *)) [super viewSafeAreaInsetsDidChange];
}

- (void)updateSafeAreaViewFrame {
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeAreaInsets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
        self.safeAreaInsetsTop = safeAreaInsets.top;
        self.safeAreaInsetsLeft = safeAreaInsets.left;
        self.safeAreaInsetsRight = safeAreaInsets.right;
        self.safeAreaInsetsBottom = safeAreaInsets.bottom;
        NSLog(@"safeAreaInsets: %@",NSStringFromUIEdgeInsets(safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
}

// MARK: - StatusBar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}


- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

// MARK: - Getter

- (UIView *)safeAreaView {
    if (!_safeAreaView) {
        _safeAreaView = [[UIView alloc] init];
        _safeAreaView.backgroundColor = UIColor.whiteColor;
    }
    return _safeAreaView;
}

- (CGFloat)navigationHeight {
    return CGRectGetHeight(self.navigationController.navigationBar.frame);
}
- (CGFloat)statusBarHeight {
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}
- (CGFloat)tabbarHeight {
    return CGRectGetHeight(self.tabBarController.tabBar.frame);
}


@end
