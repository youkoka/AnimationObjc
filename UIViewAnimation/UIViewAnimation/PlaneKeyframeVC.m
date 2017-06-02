//
//  PlaneKeyframeVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/10.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "PlaneKeyframeVC.h"

@interface PlaneKeyframeVC ()

@property (nonatomic, strong) UIImageView *plane;

@end

@implementation PlaneKeyframeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.plane = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Plane"]];
    self.plane.contentMode = UIViewContentModeScaleAspectFit;
    self.plane.frame = CGRectMake(10, 10, 50, 50);
    
    [self.view addSubview:self.plane];
}

-(void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [UIView animateKeyframesWithDuration:3.0 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews|UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
//        self.plane.frame = CGRectMake(150, 150, 30, 30);
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^(void) {
            
            self.plane.frame = CGRectMake(150, 150, 30, 30);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^(void) {
            
            self.plane.frame = CGRectMake(300, 300, 100, 100);
        }];
        
        
    } completion:^(BOOL finish) {
        
        NSLog(@"done!");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
