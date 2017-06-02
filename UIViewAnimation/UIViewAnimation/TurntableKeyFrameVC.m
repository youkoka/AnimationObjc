//
//  TurntableKeyFrameVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/10.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "TurntableKeyFrameVC.h"

@interface TurntableKeyFrameVC ()

@property (nonatomic, weak) IBOutlet UIImageView *turntable;
@property (nonatomic, assign) NSInteger index;

@end

@implementation TurntableKeyFrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.index = 1;
    
    [self animtationCircule];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animtationCircule {
    
    [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^(void) {
     
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
        
            CGFloat angle = M_PI_2 * _index;
            
            self.turntable.transform = CGAffineTransformRotate(_turntable.transform, angle);
            
            self.index++;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            
            CGFloat angle = M_PI_2 * _index;
            
            self.turntable.transform = CGAffineTransformRotate(_turntable.transform, angle);
            
            self.index++;
        }];

        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            
            CGFloat angle = M_PI_2 * _index;
            
            self.turntable.transform = CGAffineTransformRotate(_turntable.transform, angle);
            
            self.index++;
        }];

        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            
            CGFloat angle = M_PI_2 * _index;
            
            self.turntable.transform = CGAffineTransformRotate(_turntable.transform, angle);
            
            self.index++;
        }];

    }completion:^(BOOL finished) {
        
        [self animtationCircule];
    }];
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
