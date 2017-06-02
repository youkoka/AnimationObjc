//
//  TranslateAnimationVC.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "TranslateAnimationVC.h"

@interface TranslateAnimationVC ()

@property (nonatomic, weak) IBOutlet UIButton *btnTap;

@end

@implementation TranslateAnimationVC

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
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    CGFloat posX = self.view.frame.size.width / 2;
    CGFloat posY = self.view.frame.size.height - 100;
    
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(posX, posY)];
    //basicAnimation.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    basicAnimation.duration = 2.0f;
    basicAnimation.fillMode = kCAFillModeForwards;
    [basicAnimation setRemovedOnCompletion:NO];
    
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
