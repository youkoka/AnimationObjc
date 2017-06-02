//
//  DrawViewController.m
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawItem.h"

@interface DrawViewController ()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat max_radius;
@property (nonatomic, assign) BOOL isIncrease;

@property (nonatomic, strong) DrawItem *drawItem;

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.radius = 0;
    self.max_radius = 100;
    
    self.drawItem = [DrawItem new];
    
    [self.drawItem setFrame:self.view.bounds];
    [self.drawItem setBackgroundColor:[UIColor cyanColor]];
    
    [self.view addSubview:self.drawItem];
    
    [NSTimer scheduledTimerWithTimeInterval:1/30 target:self selector:@selector(animationCircle) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) animationCircle {

    [self.drawItem blackHoleIncrease:_radius];
    
    if (_isIncrease == true && _radius <= _max_radius) {
     
        _radius++;
    }
    else if(_isIncrease == false && _radius >= 0) {
        
        _radius--;
    }
    
    if (_radius >= _max_radius) {
        
        _isIncrease = false;
    }
    else if(_radius <= 0) {
        
        _isIncrease = true;
    }
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
