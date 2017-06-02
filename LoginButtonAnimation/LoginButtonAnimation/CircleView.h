//
//  CircleView.h
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/2.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CircleViewProtocol <NSObject>

-(void) circleAnimationFinish;

@end

@interface CircleView : UIView

@property (nonatomic, weak) id<CircleViewProtocol> circleDelegate;

-(void) startAnimation;

@end
