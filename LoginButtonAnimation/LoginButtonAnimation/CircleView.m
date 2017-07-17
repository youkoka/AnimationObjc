//
//  CircleView.m
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/2.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation CircleView

-(void) startAnimation {
    
    CGFloat startAngle = -90.0/180 * M_PI;
    CGFloat endAngle = -90.01/180 * M_PI;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height /2) radius:self.bounds.size.height/2 - 1 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    self.circleLayer = [CAShapeLayer layer];
    
    self.circleLayer.path = bezierPath.CGPath;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth = 3;
    [self.layer addSublayer:self.circleLayer];
    
    self.circleLayer.strokeColor = [UIColor redColor].CGColor;
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [pathAnimation setDelegate:self];
    [pathAnimation setValue:@"circleAnimation" forKey:@"circle"];
    pathAnimation.duration = 2;
    pathAnimation.fromValue = [NSNumber numberWithInt:0];
    pathAnimation.toValue = [NSNumber numberWithInt:1];
    [self.circleLayer addAnimation:pathAnimation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        
        if (self.circleDelegate != nil && [self.circleDelegate respondsToSelector:@selector(circleAnimationFinish)]) {
            
            [self.circleDelegate circleAnimationFinish];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
