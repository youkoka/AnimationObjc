//
//  MoveAnimationVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "MoveAnimationVC.h"

@interface MoveAnimationVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

-(IBAction)tapMe:(id)sender;

@end

@implementation MoveAnimationVC

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
    
    CGRect frame = _btnTap.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    
    [_btnTap setFrame:CGRectMake(frame.origin.x, frame.origin.y + 100, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    
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
