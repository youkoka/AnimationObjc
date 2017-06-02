//
//  PlayGifVC.m
//  GifParser
//
//  Created by YehHenChia on 2017/5/12.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "PlayGifVC.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface PlayGifVC ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation PlayGifVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self GifAnalysis];
    
    NSArray *dicPathAry = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dicPath = dicPathAry[0];
    
    NSMutableArray *imageAry = [NSMutableArray array];
    
    for (int i = 0; i != 73; i++) {
        
        NSString *imagePath = [NSString stringWithFormat:@"%@/dog_%d.png", dicPath, i];
        
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        
        [imageAry addObject:image];
    }

    self.imageView.animationImages = imageAry;
    self.imageView.animationDuration = 5;
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) GifAnalysis {
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
