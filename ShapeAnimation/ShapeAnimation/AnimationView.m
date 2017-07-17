//
//  AnimationView.m
//  ShapeAnimation
//
//  Created by YehHenChia on 2017/7/14.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "AnimationView.h"

@interface AnimationView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation AnimationView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    for (int i = 0; i != 2; i++) {
        
        [bezierPath moveToPoint:CGPointMake(i * 50 + 50, self.frame.size.height - 20)];
        [bezierPath addLineToPoint:CGPointMake(i * 50 + 50, 20)];
    }
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.path = bezierPath.CGPath;
    self.shapeLayer.lineCap = kCALineCapSquare;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineWidth = 20;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber numberWithInt:1];
    animation.duration = 2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.shapeLayer addAnimation:animation forKey:nil];
    
    [self.layer addSublayer:self.shapeLayer];
    
    self.clipsToBounds = YES;

}

@end
