//
//  GifAnalysisVC.m
//  GifParser
//
//  Created by YehHenChia on 2017/5/12.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "GifAnalysisVC.h"
#import <ImageIO/ImageIO.h>

@interface GifAnalysisVC ()

@end

@implementation GifAnalysisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"gif"];
    
    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
    
    if (gifData != nil) {
        
        CGImageSourceRef imageSource = CGImageSourceCreateWithData((CFDataRef)gifData, nil);
        
        NSInteger imageCount = CGImageSourceGetCount(imageSource);
        
        for (int i = 0; i != imageCount; i++) {
            
            CGImageRef imageRef = CGImageSourceCreateImageAtIndex(imageSource, i, nil);
            
            UIImage *image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        
            NSData *imageData = UIImagePNGRepresentation(image);
            
            NSArray *dicPathAry = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *dicPath = dicPathAry[0];
            
            NSString *imagePath = [NSString stringWithFormat:@"%@/dog_%d.png", dicPath, i];
            
            [imageData writeToFile:imagePath atomically:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
