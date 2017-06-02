//
//  TranslateRotateScaleVC.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/9.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "TranslateRotateScaleVC.h"

@interface TranslateRotateScaleVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation TranslateRotateScaleVC

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
    
    [_btnTap.layer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
    
    [UIView setAnimationDuration:5.0f];
    
    CGAffineTransform transform = _btnTap.transform;
    
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformRotate(transform, M_PI);
    transform = CGAffineTransformTranslate(transform, 0, -200);
    
    _btnTap.transform = transform;
    
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
