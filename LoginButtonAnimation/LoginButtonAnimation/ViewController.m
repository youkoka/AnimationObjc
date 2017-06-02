//
//  ViewController.m
//  LoginButtonAnimation
//
//  Created by YehHenChia on 2017/6/2.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"
#import "ButtonView.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, weak) IBOutlet ButtonView *btnTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction) tapMe:(id)sender {
    
    [_btnTap startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
