//
//  SimpleRotateDelegateVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/9.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "SimpleRotateDelegateVC.h"

@interface SimpleRotateDelegateVC ()<CAAnimationDelegate>

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) BOOL isStop;

@end

@implementation SimpleRotateDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.index = 1;
    self.isStop = false;
    
    [UIView beginAnimations:nil context:nil];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationEnd)];
    
    [UIView setAnimationDuration:.1f];
    
    transform = CGAffineTransformRotate(transform, M_PI_2);
    
    [_btnTap setTransform:transform];
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animationEnd {
    
    [UIView beginAnimations:nil context:nil];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    [UIView setAnimationDuration:.1f];
    
    transform = CGAffineTransformRotate(transform, M_PI_2 * _index);
    
    if (_isStop == false) {
    
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationEnd)];
        
        _index++;
    }
    
    [_btnTap setTransform:transform];
    
    [UIView commitAnimations];
}


-(IBAction) stopAnimation:(id)sender {

    self.isStop = !_isStop;
    
    if (_isStop == false) {
        
        [self performSelector:@selector(animationEnd)];
    }
}

/*
-(void) animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"start!");
}
-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"stop!");
}
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
