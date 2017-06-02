//
//  SizeCenterVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "SizeCenterVC.h"

@interface SizeCenterVC ()

@property (nonatomic, strong) IBOutlet UIButton *tap;

@end

@implementation SizeCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
 
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:2.0f];
    
    self.tap.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, self.tap.frame.size.height);
    self.tap.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [UIView commitAnimations];
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
