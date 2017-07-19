//
//  ViewController.m
//  CATransition
//
//  Created by YehHenChia on 2017/7/19.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) tapMe:(id)sender {
    
    [self.imageView setImage:[UIImage imageNamed:@"dog_1"]];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"oglFlip";
    //        transition.type = @"oglFlip"
    //        transition.type = @"cube"
    //        transition.type = @"suckEffect"
    //        transition.type = @"rippleEffect"
    //        transition.type = @"pageUnCurl"
    //        transition.type = @"pageCurl"
    //        transition.type = @"cameraIrisHollowOpen"
    //        transition.type = @"cameraIrisHollowClose"
    //        transition.type = kCATransitionFade
    //        transition.type = kCATransitionPush
    //        transition.type = kCATransitionReveal
    [self.view.layer addAnimation:transition forKey:nil];
}
@end
