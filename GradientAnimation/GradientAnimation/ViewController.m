//
//  ViewController.m
//  GradientAnimation
//
//  Created by YehHenChia on 2017/7/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, weak) IBOutlet UIView *toneView;

@property (nonatomic, strong) NSArray *colorAry;

@property (nonatomic, strong) NSMutableArray *layerAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btnTap.layer.cornerRadius = 30;
    self.btnTap.clipsToBounds = YES;
    [self.btnTap addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.gradientLayer = [CAGradientLayer layer];
    [_gradientLayer setFrame:CGRectMake(0, 0, self.btnTap.frame.size.width, self.btnTap.frame.size.height)];
    
//    _gradientLayer.colors = @[(id)UIColor.clearColor.CGColor, (id)UIColor.whiteColor.CGColor, (id)UIColor.clearColor.CGColor];
    _gradientLayer.colors = @[(id)UIColor.clearColor.CGColor, (id)UIColor.whiteColor.CGColor, (id)UIColor.clearColor.CGColor];
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 0);
    _gradientLayer.locations = @[@(0), @(.05), @(.1)];
    [self.btnTap.layer addSublayer:_gradientLayer];
    
    [self setColor];
    
    self.layerAry = [NSMutableArray array];
}

-(void) viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    for (int i = 0; i != 10; i++) {
     
        CGFloat width = 10;
        CGFloat height = self.toneView.frame.size.height - 10;
        CGFloat x = 20;
        CGFloat y = 10;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x * i + 20, y, width, height)];
        [self.toneView addSubview:view];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = view.bounds;
        gradientLayer.startPoint = CGPointMake(0, 1);
        gradientLayer.endPoint = CGPointMake(0, 0);
        [view.layer addSublayer:gradientLayer];
        [self.layerAry addObject:gradientLayer];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
}

-(void) changeColor {
    
    for (int i = 0; i != 10; i++) {
        
        CAGradientLayer *gradientLayer = [self.layerAry objectAtIndex:i];
        
//        int randValue = arc4random_uniform(4);
        
        UIColor *randColor = [self.colorAry objectAtIndex:rand() % 5];
        gradientLayer.colors = @[(id)randColor.CGColor, (id)UIColor.clearColor.CGColor];
        gradientLayer.locations = @[@(0), @(1)];
        
        CABasicAnimation *gradientAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
        CGFloat beginValue = (CGFloat)arc4random_uniform(11) / 10;
        gradientAnimation.fromValue = @[@(beginValue), @(beginValue)];
        gradientAnimation.toValue = @[@(1), @(1)];
        gradientAnimation.duration = 0.4;
        [gradientLayer addAnimation:gradientAnimation forKey:nil];
    }
}

-(void) tap:(UIButton *)sender {

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@(0), @(0.05), @(0.1)];
    basicAnimation.toValue = @[@(0.9), @(0.95), @(1)];
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = 2;
    basicAnimation.autoreverses = YES;
//    [basicAnimation setIsAccessibilityElement:NO];
//    basicAnimation.fillMode = kCAFillModeBackwards;
    
    [_gradientLayer addAnimation:basicAnimation forKey:nil];
    
}

-(void) setColor {
    
    self.colorAry = [NSArray arrayWithObjects:[UIColor blueColor], [UIColor greenColor], [UIColor purpleColor], [UIColor orangeColor], [UIColor grayColor], nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
