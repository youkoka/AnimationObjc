//
//  CornerRadiusAnimationVC.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "CornerRadiusAnimationVC.h"

@interface CornerRadiusAnimationVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation CornerRadiusAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    
    basicAnimation.toValue = [NSNumber numberWithFloat:15.0f];
    basicAnimation.duration = 2;
    [basicAnimation setRemovedOnCompletion:NO];
    basicAnimation.fillMode = kCAFillModeForwards;
    
    [self.btnTap.layer addAnimation:basicAnimation forKey:nil];
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
