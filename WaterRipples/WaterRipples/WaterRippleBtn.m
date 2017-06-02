//
//  WaterRippleBtn.m
//  WaterRipples
//
//  Created by YehHenChia on 2017/5/22.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "WaterRippleBtn.h"

#define DrawCount   30

@interface WaterRippleBtn()

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) CGFloat posX;

@property (nonatomic, assign) CGFloat posY;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger count;

@end

@implementation WaterRippleBtn

-(void) startButtonAnimation:(UIButton *) btn event:(UIEvent *)touchEvent  {
    
    self.radius = 1;
    self.count = 0;
    
    self.userInteractionEnabled = NO;
    
    NSSet *touchSet =  touchEvent.allTouches;
    
    NSArray *touchAry = touchSet.allObjects;
    
    UITouch *touch = [touchAry objectAtIndex:0];
    
    CGPoint pt = [touch locationInView:self];
    
    self.posX = pt.x;
    self.posY = pt.y;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void) timerAction {
    
    self.count++;
    
    dispatch_time_t dispatch_time_t = DISPATCH_TIME_NOW + (int64_t)((0 * NSEC_PER_SEC) / (double)NSEC_PER_SEC);
    
    dispatch_after(dispatch_time_t, dispatch_get_main_queue(), ^{
        
        self.radius += 1;
        [self setNeedsDisplay];
        
    });
    
    if (_count > DrawCount) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        dispatch_after(dispatch_time_t, dispatch_get_main_queue(), ^{
            
            self.radius = 0;
            [self setNeedsDisplay];
        });
        
        self.userInteractionEnabled = YES;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context, _posX, _posY, _radius, 0, M_PI * 2, NO);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);

    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
