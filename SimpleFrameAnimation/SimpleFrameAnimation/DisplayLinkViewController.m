//
//  DisplayLinkViewController.m
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "DisplayLinkViewController.h"

@interface DisplayLinkViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation DisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.index = 0;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 150)];
    
    [self.view addSubview:self.imageView];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animaitonCircle)];
    
    [displayLink setPreferredFramesPerSecond:30];
    
    [displayLink addToRunLoop:NSRunLoop.currentRunLoop forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animaitonCircle {
    
    self.index %= 67;
    
    NSString *imageName = [NSString stringWithFormat:@"%ld.png", _index];
    
    self.imageView.image = [UIImage imageNamed:imageName];
    
    self.index++;
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
