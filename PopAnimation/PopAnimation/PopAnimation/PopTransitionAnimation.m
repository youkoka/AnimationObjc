//
//  PopTransitionAnimation.m
//  PopAnimation
//
//  Created by YehHenChia on 2017/7/19.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "PopTransitionAnimation.h"

@implementation PopTransitionAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>) transitionContext {
    
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    /* ---- 以下必要固定程式 -----*/
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //! 需要將要轉換的View加進Container view 裡
    UIView *containerView = transitionContext.containerView;
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    /* ---- 以上必要固定程式 -----*/
    
    /* ---- 以下為動畫 -----*/
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
    
        fromVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        
    } completion:^(BOOL finished) {
        
        /* ---- 動畫結束後一定要通知系統, 否則會卡住 -----*/
        [transitionContext completeTransition:(!transitionContext.transitionWasCancelled)];
    }];
    
}

@end
