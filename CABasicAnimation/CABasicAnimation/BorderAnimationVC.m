//
//  BorderAnimationVC.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "BorderAnimationVC.h"

@interface BorderAnimationVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation BorderAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.btnTap.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.btnTap.layer setBorderWidth:1.0f];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSLog(@"here!");
}

-(void) viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    NSLog(@"here!");
}

-(IBAction)tapMe:(id)sender {
    
    CABasicAnimation *borderWidthAnimation = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    
    borderWidthAnimation.toValue = [NSNumber numberWithFloat:10];
    //borderWidthAnimation.duration = 1.0f;
    //[borderWidthAnimation setRemovedOnCompletion:NO];
    //[borderWidthAnimation setFillMode:kCAFillModeForwards];
    
    CABasicAnimation *borderColorAnimation = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColorAnimation.toValue = (id)[UIColor greenColor].CGColor;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:borderWidthAnimation, borderColorAnimation, nil];
    animationGroup.duration = 2.0f;
    [animationGroup setFillMode:kCAFillModeForwards];
    [animationGroup setRemovedOnCompletion:NO];
    [self.btnTap.layer addAnimation:animationGroup forKey:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
