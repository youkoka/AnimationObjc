//
//  KeyFrameLayerViewController.m
//  ReplicationAnimation
//
//  Created by YehHenChia on 2017/7/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "KeyFrameLayerViewController.h"

@interface KeyFrameLayerViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *sunImgView;

@property (nonatomic, strong) UIImageView *earthImgView;

@end

@implementation KeyFrameLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.earthImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth"]];
    [self.earthImgView setFrame:CGRectMake(0, 0, 32, 32)];
    [self.view addSubview:self.earthImgView];
    
//    CGFloat raidus = _sunImgView.center.x - _earthImgView.center.x;
    CGFloat radius = 100;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:_sunImgView.center radius:radius startAngle:0 endAngle:(M_PI * 2) clockwise:YES];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = bezierPath.CGPath;
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    
    [self.earthImgView.layer addAnimation:keyFrameAnimation forKey:nil];
    
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceDelay = 0.5;
    replicatorLayer.instanceCount = 10;
    [replicatorLayer addSublayer:self.earthImgView.layer];
//    [replicatorLayer addSublayer:self.sunImgView.layer];
    
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
