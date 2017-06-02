//
//  DrawItem.m
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "DrawItem.h"

@interface DrawItem()

@property (nonatomic, assign) CGFloat radius;

@end

@implementation DrawItem

-(void) blackHoleIncrease:(CGFloat) radius {
    
    self.radius = radius;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, self.center.x, self.center.y, _radius, 0, M_PI * 2, false);
    
    CGContextFillPath(ctx);
}


@end
