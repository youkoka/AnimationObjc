//
//  GifSynthesisVC.m
//  GifParser
//
//  Created by YehHenChia on 2017/5/12.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "GifSynthesisVC.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GifSynthesisVC ()

@end

@implementation GifSynthesisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *dicPathAry = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dicPath = dicPathAry[0];

    NSMutableArray *imageAry = [NSMutableArray array];
    
    for (int i = 0; i != 73; i++) {
        
        NSString *imagePath = [NSString stringWithFormat:@"%@/dog_%d.png", dicPath, i];
        
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        
        [imageAry addObject:image];
    }
    
    NSString *gifPath = [NSString stringWithFormat:@"%@/dog.gif", dicPath];
    
    CFURLRef urlRef = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)gifPath, kCFURLPOSIXPathStyle, NO);
    
    CGImageDestinationRef destination = CGImageDestinationCreateWithURL(urlRef, kUTTypeGIF, imageAry.count, nil);
    
    //! 設定檔案屬性
    NSDictionary *fileProperties = @{
                                     (__bridge id)kCGImagePropertyGIFDictionary : @{
                                             (__bridge id)kCGImagePropertyGIFLoopCount:@0,
                                             (__bridge id)kCGImagePropertyColorModel:(__bridge id)kCGImagePropertyColorModelRGB,
                                             (__bridge id)kCGImagePropertyDepth:@16}};
    
    CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)fileProperties);
    
    //! 設定播放屬性
    NSDictionary *frameProperties = @{(__bridge id)kCGImagePropertyGIFDictionary:@{(__bridge id)kCGImagePropertyGIFDelayTime:@0.1}};
    
    for (int i = 0; i != 73; i++) {
        
        UIImage *image = [imageAry objectAtIndex:i];
        
        //! 新增圖片
        CGImageDestinationAddImage(destination, image.CGImage, (__bridge CFDictionaryRef)frameProperties);
    }
    
    if (!CGImageDestinationFinalize(destination)) {
        NSLog(@"failed to finalize image destination");
    }
    CFRelease(destination);
    
    NSLog(@"url=%@", gifPath);
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
