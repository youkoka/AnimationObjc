//
//  RotationViewController.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "RotationViewController.h"

#define DegreesToRadians(degrees)((M_PI * degrees)/180)

@interface RotationViewController ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
    
    //! keyPath : transform.rotation, transform.rotation.x, transform.rotation.y
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    //basicAnimation.fromValue = [NSNumber numberWithFloat:M_PI];
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2]; //! +:clockwise, -:anit clockwise
    basicAnimation.duration = 2.0f;
    basicAnimation.fillMode = kCAFillModeForwards;
    //basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
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
