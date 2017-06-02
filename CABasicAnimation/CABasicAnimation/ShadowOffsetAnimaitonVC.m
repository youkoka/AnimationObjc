//
//  ShadowOffsetAnimaitonVC.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ShadowOffsetAnimaitonVC.h"

@interface ShadowOffsetAnimaitonVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation ShadowOffsetAnimaitonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.btnTap.layer.shadowColor = [UIColor grayColor].CGColor;
    self.btnTap.layer.shadowOpacity = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapMe:(id)sender {
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    
    basicAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(10, 10)];
    basicAnimation.duration = 2.0f;
    [basicAnimation setRemovedOnCompletion:NO];
    basicAnimation.fillMode = kCAFillModeForwards;
    
    [self.btnTap.layer addAnimation:basicAnimation forKey:nil];
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
