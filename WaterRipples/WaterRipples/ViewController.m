//
//  ViewController.m
//  WaterRipples
//
//  Created by YehHenChia on 2017/5/22.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"
#import "WaterRippleBtn.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet WaterRippleBtn *btnTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.btnTap addTarget:self action:@selector(tapMe:event:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender event:(UIEvent *)event {
    
    [_btnTap startButtonAnimation:sender event:event];
}

@end
