//
//  ViewController.m
//  PopAnimation
//
//  Created by YehHenChia on 2017/7/19.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"View Controller";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapPush:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"NewViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
