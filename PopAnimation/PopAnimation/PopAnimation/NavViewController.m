//
//  NavViewController.m
//  PopAnimation
//
//  Created by YehHenChia on 2017/7/19.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "NavViewController.h"
#import "PushTransitionAnimation.h"
#import "PopTransitionAnimation.h"

@interface NavViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//!  新增手勢監控
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    UIPanGestureRecognizer *popRecongnizer = [UIPanGestureRecognizer new];
    popRecongnizer.delegate = self;
    [popRecongnizer addTarget:self action:@selector(handlePopRecongnizer:)];
    [self.view addGestureRecognizer:popRecongnizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handlePopRecongnizer:(UIPanGestureRecognizer *)gestureRecognizer {
    
    /**
     *  interactivePopTransition就是我们说的方法2返回的对象，我们需要更新它的进度来控制Pop动画的流程，我们用手指在视图中的位置与视图宽度比例作为它的进度。
     */
    CGFloat progress = [gestureRecognizer translationInView:gestureRecognizer.view].x / gestureRecognizer.view.bounds.size.width;
    /**
     *  稳定进度区间，让它在0.0（未完成）～1.0（已完成）之间
     */
    progress = MIN(1.0, MAX(0.0, progress));
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        /**
         *  手势开始，新建一个监控对象
         */
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        /**
         *  告诉控制器开始执行pop的动画
         */
        
        [self popViewControllerAnimated:YES];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        
        /**
         *  更新手势的完成进度
         */
        [self.interactivePopTransition updateInteractiveTransition:progress];
        
    }
    else if(gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        
        [self.interactivePopTransition cancelInteractiveTransition];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        /**
         *  手势结束时如果进度大于一半，那么就完成pop操作，否则重新来过。
         */
        if (progress > 0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else {
            
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        
        self.interactivePopTransition = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([self.viewControllers count] > 1) {
        
        return YES;
    }
    
    return NO;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    if ([animationController isKindOfClass:[PopTransitionAnimation class]]) {
        
        return self.interactivePopTransition;
    }
    
    return nil;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
    
        return [PushTransitionAnimation new];
    }
    else if (operation == UINavigationControllerOperationPop){
        
        return [PopTransitionAnimation new];
    }
    
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
