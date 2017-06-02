//
//  ButtonView.m
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/2.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ButtonView.h"
#import "CircleView.h"

@interface ButtonView()<CAAnimationDelegate, CircleViewProtocol>

@property (nonatomic, strong) CircleView *circleView;

@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) UIView *boarderView;

@end

@implementation ButtonView

-(void) startAnimation {
    
    self.originX = self.bounds.origin.x;
    self.originY = self.bounds.origin.y;
    
    self.width = self.bounds.size.width;
    self.height = self.bounds.size.height;
    
    self.boarderView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:self.boarderView];
    
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.circleView.circleDelegate = self;
    [self addSubview:self.circleView];
    
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(_originX + (_width - _height)/2, _originY, _height, _height)];
    
    CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    roundedAnimation.toValue = [NSNumber numberWithFloat:_height / 2];
    
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (id)[UIColor clearColor].CGColor;
    
//    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    alphaAnimation.fromValue = [NSNumber numberWithInt:1];
//    alphaAnimation.toValue = [NSNumber numberWithFloat:0];
    
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColor.toValue = (id)[UIColor grayColor].CGColor;
    
    CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidth.toValue = [NSNumber numberWithInt:2];
    
    CAAnimationGroup *btnAnimationGroup = [CAAnimationGroup animation];
    [btnAnimationGroup setValue:@"btnAnimationGroup" forKey:@"btnAnimation"];
    btnAnimationGroup.duration = 2.0;
    btnAnimationGroup.fillMode = kCAFillModeForwards;
    [btnAnimationGroup setRemovedOnCompletion:NO];
    [btnAnimationGroup setDelegate:self];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [btnAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, bgColorAnimation, nil]];
    
    CAAnimationGroup *borderAnimationGroup = [CAAnimationGroup animation];
    [borderAnimationGroup setValue:@"borderAnimationGroup" forKey:@"borderAnimation"];
    borderAnimationGroup.duration = 2.0;
    borderAnimationGroup.fillMode = kCAFillModeForwards;
    [borderAnimationGroup setRemovedOnCompletion:NO];
    [borderAnimationGroup setDelegate:self];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [borderAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderColor, borderWidth, nil]];
    
    [CATransaction begin];
    [self.boarderView.layer addAnimation:borderAnimationGroup forKey:nil];
    [self.layer addAnimation:btnAnimationGroup forKey:nil];
    [CATransaction commit];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        
        NSString *borderAnimation = [anim valueForKey:@"borderAnimation"];
        NSString *borderSpeardAnimation = [anim valueForKey:@"borderSpeardAnimation"];
        
        if (borderAnimation != nil && [borderAnimation isEqualToString:@"borderAnimationGroup"]) {
            
            [self.circleView startAnimation];
        }
        else if(borderSpeardAnimation != nil && [borderSpeardAnimation isEqualToString:@"borderSpeardAnimationGroup"]) {
            
            [self.boarderView removeFromSuperview];
        }
    }
}

-(void) circleAnimationFinish {
    
    [self.circleView removeFromSuperview];
    
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(_originX + (_width - _height)/2, _originY, _height, _height)];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, _width, _height)];
    
    CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    roundedAnimation.fromValue = [NSNumber numberWithFloat:_height / 2];
    roundedAnimation.toValue = 0;
    
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (id)[UIColor greenColor].CGColor;
    
    CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidth.toValue = [NSNumber numberWithInt:0];
    
    CAAnimationGroup *btnSpeardAnimationGroup = [CAAnimationGroup animation];
    btnSpeardAnimationGroup.duration = 2.0;
    btnSpeardAnimationGroup.fillMode = kCAFillModeForwards;
    [btnSpeardAnimationGroup setRemovedOnCompletion:NO];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [btnSpeardAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, bgColorAnimation, nil]];
    
    CAAnimationGroup *borderSpeardAnimationGroup = [CAAnimationGroup animation];
    [borderSpeardAnimationGroup setValue:@"borderSpeardAnimationGroup" forKey:@"borderSpeardAnimation"];
    [borderSpeardAnimationGroup setDelegate:self];
    borderSpeardAnimationGroup.duration = 2.0;
    borderSpeardAnimationGroup.fillMode = kCAFillModeForwards;
    [borderSpeardAnimationGroup setRemovedOnCompletion:NO];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [borderSpeardAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderWidth, nil]];
    
    [CATransaction begin];
    [self.boarderView.layer addAnimation:borderSpeardAnimationGroup forKey:nil];
    [self.layer addAnimation:btnSpeardAnimationGroup forKey:nil];
    [CATransaction commit];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
