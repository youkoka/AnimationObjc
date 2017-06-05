//
//  ViewController.m
//  Emitter
//
//  Created by YehHenChia on 2017/6/5.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.name = @"heart";
    emitterCell.emissionLongitude = M_PI; //! 角度
    emitterCell.emissionRange = M_PI; //! 角度範圍
    emitterCell.velocity = 1;   //! 速度
    emitterCell.velocityRange = 100; //! 速度範圍
    
    //!----- scale -> scaleSpeed
    emitterCell.scaleSpeed = 0.1;   //! 縮放比例速度
    emitterCell.scale = 0.1;        //!
    //!----
    emitterCell.yAcceleration = -200; //! y加速度
    emitterCell.lifetime = 4;    //! 生命週期
    emitterCell.birthRate = 3;  //! 生成速率
    emitterCell.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor;
    emitterCell.contents = (__bridge id)[UIImage imageNamed:@"heart"].CGImage;
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.frame.size.height);
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.emitterCells = @[emitterCell];
    [self.view.layer addSublayer:emitterLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
