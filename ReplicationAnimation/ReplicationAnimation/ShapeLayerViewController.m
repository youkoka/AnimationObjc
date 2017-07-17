//
//  ShapeLayerViewController.m
//  ReplicationAnimation
//
//  Created by YehHenChia on 2017/7/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ShapeLayerViewController.h"

@interface ShapeLayerViewController ()

@end

@implementation ShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(14, 200, 10, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.duration = 1;
    basicAnimation.fromValue = [NSNumber numberWithInteger:200];
    basicAnimation.toValue = [NSNumber numberWithInteger:180];
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = MAXFLOAT;
    [layer addAnimation:basicAnimation forKey:nil];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.transform = CATransform3DMakeTranslation(20, 0, 0);
//    [replicatorLayer setBackgroundColor:[UIColor blackColor].CGColor];
//    replicatorLayer.masksToBounds = YES;
    replicatorLayer.instanceCount = 10;
    replicatorLayer.instanceDelay = 1;
    [replicatorLayer addSublayer:layer];
    
    [self.view.layer addSublayer:replicatorLayer];
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
