//
//  ZHJBaseViewController.h
//  ZHJPainter
//
//  Created by Jun Zhou on 2019/9/30.
//  Copyright © 2019 Jun Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHJBaseViewController : UIViewController

@property (nonatomic, strong, readonly) UIView *safeAreaView;

@property (nonatomic, assign, readonly) CGFloat safeAreaInsetsTop;

@property (nonatomic, assign, readonly) CGFloat safeAreaInsetsLeft;

@property (nonatomic, assign, readonly) CGFloat safeAreaInsetsRight;

@property (nonatomic, assign, readonly) CGFloat safeAreaInsetsBottom;

@property (nonatomic, assign, readonly) CGFloat navigationHeight;

@property (nonatomic, assign, readonly) CGFloat statusBarHeight;

@property (nonatomic, assign, readonly) CGFloat tabbarHeight;


@end

NS_ASSUME_NONNULL_END
