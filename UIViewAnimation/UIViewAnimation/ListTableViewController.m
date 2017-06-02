//
//  ListTableViewController.m
//  UIViewAnimation
//
//  Created by YehHenChia on 2017/5/8.
//  Copyright © 2017年 YenHenChia. All rights reserved.
//

#import "ListTableViewController.h"

#import "MoveAnimationVC.h"
#import "SizeCenterVC.h"
#import "AlphaColorVC.h"
#import "TranslateRotateScaleVC.h"
#import "SimpleRotateDelegateVC.h"
#import "PlaneKeyframeVC.h"
#import "TurntableKeyFrameVC.h"

typedef NS_ENUM(NSInteger, kListCell) {

    kListCellMove = 0,
    kListCellSizeCenter,
    kListCellAlphaColor,
    kListCellTranslateRotateScale,
    kListCellSimpleRotateDelegate,
    kListCellPlaneKeyframe,
    kListCellTurntableKeyframe,
};

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *listCellAry;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"目錄";
    
    self.listCellAry = [NSArray arrayWithObjects:
                        [NSNumber numberWithInteger:kListCellMove],
                        [NSNumber numberWithInteger:kListCellSizeCenter],
                        [NSNumber numberWithInteger:kListCellAlphaColor],
                        [NSNumber numberWithInteger:kListCellTranslateRotateScale],
                        [NSNumber numberWithInteger:kListCellSimpleRotateDelegate],
                        [NSNumber numberWithInteger:kListCellPlaneKeyframe],
                        [NSNumber numberWithInteger:kListCellTurntableKeyframe], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_listCellAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    NSInteger index = [[_listCellAry objectAtIndex:indexPath.row] integerValue];
    
    switch (index) {
            
        case kListCellMove: {
            
            [cell.textLabel setText:@"Move Animation"];
        }
            break;
        case kListCellSizeCenter: {
            
            [cell.textLabel setText:@"SizeCenter Animation"];
        }
            break;
        case kListCellAlphaColor: {
            
            [cell.textLabel setText:@"AlphaColor Animation"];
        }
            break;
        case kListCellTranslateRotateScale: {
            
            [cell.textLabel setText:@"TranslateRotateScale Animation"];
        }
            break;
        case kListCellSimpleRotateDelegate: {
            
            [cell.textLabel setText:@"SimpleRotateDelegate Animation"];
        }
            break;
        case kListCellPlaneKeyframe: {
            
            [cell.textLabel setText:@"PlaneKeyframe Animation"];
        }
            break;
        case kListCellTurntableKeyframe: {
            
            [cell.textLabel setText:@"TurntableKeyframe Animation"];

        }
            break;
        default:
            break;
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = [[_listCellAry objectAtIndex:indexPath.row] integerValue];
    
    switch (index) {
            
        case kListCellMove: {
            
            MoveAnimationVC *moveAnimationVC = [[MoveAnimationVC alloc] initWithNibName:@"MoveAnimationVC" bundle:nil];
            
            [moveAnimationVC setTitle:@"Move Animation"];
            
            [self.navigationController pushViewController:moveAnimationVC animated:YES];
        }
            break;
        case kListCellSizeCenter: {
            
            SizeCenterVC * sizeCenterVC = [[SizeCenterVC alloc] initWithNibName:@"SizeCenterVC" bundle:nil];
            
            [sizeCenterVC setTitle:@"SizeCenter"];
            
            [self.navigationController pushViewController:sizeCenterVC animated:YES];
        }
            break;
        case kListCellAlphaColor: {
            
            AlphaColorVC * alphaColorVC = [[AlphaColorVC alloc] initWithNibName:@"AlphaColorVC" bundle:nil];
            
            [alphaColorVC setTitle:@"AlphaColor"];
            
            [self.navigationController pushViewController:alphaColorVC animated:YES];
        }
            break;
        case kListCellTranslateRotateScale: {
            
            TranslateRotateScaleVC * translateRotateScaleVC = [[TranslateRotateScaleVC alloc] initWithNibName:@"TranslateRotateScaleVC" bundle:nil];
            
            [translateRotateScaleVC setTitle:@"TranslateRotateScale"];
            
            [self.navigationController pushViewController:translateRotateScaleVC animated:YES];
        }
            break;
        case kListCellSimpleRotateDelegate: {
            
            SimpleRotateDelegateVC * simpleRotateDelegateVC = [[SimpleRotateDelegateVC alloc] initWithNibName:@"SimpleRotateDelegateVC" bundle:nil];
            
            [simpleRotateDelegateVC setTitle:@"simpleRotate"];
            
            [self.navigationController pushViewController:simpleRotateDelegateVC animated:YES];
        }
            break;
        case kListCellPlaneKeyframe: {
            
            PlaneKeyframeVC * planeKeyframeVC = [[PlaneKeyframeVC alloc] initWithNibName:@"PlaneKeyframeVC" bundle:nil];
            
            [planeKeyframeVC setTitle:@"PlaneKeyframe"];
            
            [self.navigationController pushViewController:planeKeyframeVC animated:YES];
        }
            break;
        case kListCellTurntableKeyframe: {
            
            TurntableKeyFrameVC * turntableKeyFrameVC = [[TurntableKeyFrameVC alloc] initWithNibName:@"TurntableKeyFrameVC" bundle:nil];
            
            [turntableKeyFrameVC setTitle:@"TurntableKeyFrame"];
            
            [self.navigationController pushViewController:turntableKeyFrameVC animated:YES];
        }
            break;
        default:
            break;
    }

}

@end
