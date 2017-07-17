//
//  TrangleView.m
//  ShapeAnimation
//
//  Created by YehHenChia on 2017/7/14.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "TrangleView.h"

@interface TrangleView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation TrangleView

-(void) show {

    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    bezierPath.lineWidth = 10;
    [bezierPath moveToPoint:CGPointMake(20, 20)];
    
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width /2, self.frame.size.height - 20)];
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width - 20, 20)];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    [bezierPath closePath];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.path = bezierPath.CGPath;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineWidth = 3;
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}


@end
