//
//  AlphaColorVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/9.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "AlphaColorVC.h"

@interface AlphaColorVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation AlphaColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:3.0f];
    
    [_btnTap setAlpha:0.2f];
    [_btnTap setBackgroundColor:[UIColor grayColor]];
    
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
