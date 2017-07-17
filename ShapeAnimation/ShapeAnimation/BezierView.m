//
//  BezierView.m
//  ShapeAnimation
//
//  Created by YehHenChia on 2017/7/14.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 moveToPoint:CGPointMake(100, self.frame.size.height - 20)];
    [bezierPath1 addLineToPoint:CGPointMake(100, 20)];
    [[UIColor redColor] setStroke];
    [bezierPath1 stroke];

    UIBezierPath *bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 moveToPoint:CGPointMake(150, self.frame.size.height - 20)];
    [bezierPath2 addLineToPoint:CGPointMake(150, 20)];
    [[UIColor blueColor] setStroke];
    [bezierPath2 stroke];

}


@end
