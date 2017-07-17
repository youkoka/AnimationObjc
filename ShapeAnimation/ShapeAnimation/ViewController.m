//
//  ViewController.m
//  ShapeAnimation
//
//  Created by YehHenChia on 2017/7/12.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"
#import "TrangleView.h"
#import "AnimationView.h"
#import "BezierView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet BezierView *bezierView;

@property (nonatomic, weak) IBOutlet TrangleView *trangleView;

@property (nonatomic, weak) IBOutlet AnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self.trangleView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
