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
    
    //! 縮成正方形
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(_originX + (_width - _height)/2, _originY, _height, _height)];
    
    //! 縮圓角
    CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    roundedAnimation.toValue = [NSNumber numberWithFloat:_height / 2];
    
    //! 設定與背景顏色相同
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (id)[UIColor clearColor].CGColor;
    
//    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    alphaAnimation.fromValue = [NSNumber numberWithInt:1];
//    alphaAnimation.toValue = [NSNumber numberWithFloat:0];
    
    //! 設定框線顏色
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColor.toValue = (id)[UIColor grayColor].CGColor;
    
    //! 設定框線
    CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidth.toValue = [NSNumber numberWithInt:2];
    
    //! 作用於按鈕動畫
    CAAnimationGroup *btnAnimationGroup = [CAAnimationGroup animation];
    [btnAnimationGroup setValue:@"btnAnimationGroup" forKey:@"btnAnimation"];
    btnAnimationGroup.duration = 2.0;
    btnAnimationGroup.fillMode = kCAFillModeForwards;
    [btnAnimationGroup setRemovedOnCompletion:NO];
    [btnAnimationGroup setDelegate:self];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [btnAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, bgColorAnimation, nil]];
    
    //! 作用於外框動畫
    CAAnimationGroup *borderAnimationGroup = [CAAnimationGroup animation];
    [borderAnimationGroup setValue:@"borderAnimationGroup" forKey:@"borderAnimation"];
    borderAnimationGroup.duration = 2.0;
    borderAnimationGroup.fillMode = kCAFillModeForwards;
    [borderAnimationGroup setRemovedOnCompletion:NO];
    [borderAnimationGroup setDelegate:self];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [borderAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderColor, borderWidth, nil]];
    
    //! 開始動畫
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
        
            //! 第一階段動畫結束, 開始畫圓
            [self.circleView startAnimation];
        }
        else if(borderSpeardAnimation != nil && [borderSpeardAnimation isEqualToString:@"borderSpeardAnimationGroup"]) {
            
            //! 最後動畫結束, 將覆蓋的外框移除
            [self.boarderView removeFromSuperview];
        }
    }
}

//! 畫圓動畫結束event
-(void) circleAnimationFinish {
    
    //! 將圓移除
    [self.circleView removeFromSuperview];
    
    //! 回復長方形
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(_originX + (_width - _height)/2, _originY, _height, _height)];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, _width, _height)];
    
    //! 回復方形狀態
    CABasicAnimation *roundedAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    roundedAnimation.fromValue = [NSNumber numberWithFloat:_height / 2];
    roundedAnimation.toValue = 0;
    
    //! 設定背景圖
    CABasicAnimation *bgColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    bgColorAnimation.toValue = (id)[UIColor greenColor].CGColor;
    
    CABasicAnimation *borderWidth = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidth.toValue = [NSNumber numberWithInt:0];
    
    //! 作用於按鈕動畫
    CAAnimationGroup *btnSpeardAnimationGroup = [CAAnimationGroup animation];
    btnSpeardAnimationGroup.duration = 2.0;
    btnSpeardAnimationGroup.fillMode = kCAFillModeForwards;
    [btnSpeardAnimationGroup setRemovedOnCompletion:NO];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [btnSpeardAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, bgColorAnimation, nil]];
    
    //! 作用於外框動畫
    CAAnimationGroup *borderSpeardAnimationGroup = [CAAnimationGroup animation];
    [borderSpeardAnimationGroup setValue:@"borderSpeardAnimationGroup" forKey:@"borderSpeardAnimation"];
    [borderSpeardAnimationGroup setDelegate:self];
    borderSpeardAnimationGroup.duration = 2.0;
    borderSpeardAnimationGroup.fillMode = kCAFillModeForwards;
    [borderSpeardAnimationGroup setRemovedOnCompletion:NO];
    //    step1Group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [borderSpeardAnimationGroup setAnimations:[NSArray arrayWithObjects:boundsAnimation, roundedAnimation, borderWidth, nil]];
    
    //! 開始動畫
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
