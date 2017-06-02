//
//  ColorOpacityAnimationVC.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ColorOpacityAnimationVC.h"

@interface ColorOpacityAnimationVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation ColorOpacityAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
    
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (id)[UIColor greenColor].CGColor;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.2];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:bgColorAnimation, opacityAnimation, nil];
    animationGroup.duration = 2.0f;
    animationGroup.fillMode = kCAFillModeForwards;
    [animationGroup setRemovedOnCompletion:NO];
    
    [self.btnTap.layer addAnimation:animationGroup forKey:nil];
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
