//
//  ViewController.m
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/2.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@property (nonatomic, strong) CAShapeLayer *circle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction) tapMe:(id)sender {
    
    //! first step group : 縮小變圓
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(_btnTap.bounds.origin.x + (_btnTap.bounds.size.width - _btnTap.bounds.size.height)/2, _btnTap.bounds.origin.y, _btnTap.bounds.size.height, _btnTap.bounds.size.height)];
    
    CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    roundedAnimation.toValue = [NSNumber numberWithFloat:_btnTap.bounds.size.height / 2];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0];;
    
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColor.toValue = (id)[UIColor grayColor].CGColor;
    
    CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidth.toValue = [NSNumber numberWithInt:2];
    
    CAAnimationGroup *step1Group = [CAAnimationGroup animation];
    [step1Group setValue:@"step1Animation" forKey:@"step1"];
    step1Group.duration = 2.0;
    step1Group.fillMode = kCAFillModeForwards;
    [step1Group setRemovedOnCompletion:NO];
    [step1Group setDelegate:self];
//    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [step1Group setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderColor, borderWidth, nil]];
    
    [_btnTap.layer addAnimation:step1Group forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        
        NSString *step1 = [anim valueForKey:@"step1"];
        NSString *step2 = [anim valueForKey:@"step2"];
        
        if ( step1 != nil && [step1 isEqualToString:@"step1Animation"]) {
            
            CGFloat startAngle = -90.0/180 * M_PI;
            CGFloat endAngle = -90.01/180 * M_PI;
            
            UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_btnTap.bounds.size.width/2, _btnTap.bounds.size.height /2) radius:_btnTap.bounds.size.height/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
            
            self.circle = [CAShapeLayer layer];
            
            self.circle.path = bezierPath.CGPath;
            self.circle.lineCap = kCALineCapRound;
            self.circle.fillColor = [UIColor clearColor].CGColor;
            self.circle.lineWidth = 2;
            [_btnTap.layer addSublayer:self.circle];
            
            self.circle.strokeColor = [UIColor redColor].CGColor;
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            [pathAnimation setDelegate:self];
            [pathAnimation setValue:@"step2Animation" forKey:@"step2"];
            pathAnimation.duration = 3;
            pathAnimation.fromValue = [NSNumber numberWithInt:0];
            pathAnimation.toValue = [NSNumber numberWithInt:1];
            [self.circle addAnimation:pathAnimation forKey:nil];
        }
        else if ( step2 != nil && [step2 isEqualToString:@"step2Animation"]) {
        
            [self.circle removeFromSuperlayer];
            
            CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
            
            boundsAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(_btnTap.bounds.origin.x + (_btnTap.bounds.size.width - _btnTap.bounds.size.height)/2, _btnTap.bounds.origin.y, _btnTap.bounds.size.height, _btnTap.bounds.size.height)];
            
            boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, _btnTap.bounds.size.width, _btnTap.bounds.size.height)];
            
            CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
            roundedAnimation.fromValue = [NSNumber numberWithFloat:_btnTap.bounds.size.height / 2];
            roundedAnimation.toValue = 0;
            
            CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnimation.toValue = [NSNumber numberWithFloat:1];;
            
            CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
            borderColor.toValue = (id)[UIColor greenColor].CGColor;
            
            CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
            borderWidth.toValue = [NSNumber numberWithInt:0];
            
            CAAnimationGroup *step3Group = [CAAnimationGroup animation];
            [step3Group setValue:@"step3Animation" forKey:@"step3"];
            step3Group.duration = 2.0;
            step3Group.fillMode = kCAFillModeForwards;
            [step3Group setRemovedOnCompletion:NO];
            [step3Group setDelegate:self];
            //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [step3Group setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderColor, borderWidth, nil]];
            [_btnTap.layer addAnimation:step3Group forKey:nil];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
