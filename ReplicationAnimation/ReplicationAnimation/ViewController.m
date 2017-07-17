//
//  ViewController.m
//  ReplicationAnimation
//
//  Created by YehHenChia on 2017/7/17.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"
#import "KeyFrameLayerViewController.h"
#import "ShapeLayerViewController.h"

typedef NS_ENUM(NSInteger, kCellList)
{
    kCellListKeyFrameLayer = 0,
    kCellListShapeLayer,
};

@interface ViewController ()

@property (nonatomic, strong) NSArray *listAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listAry = [NSArray arrayWithObjects:
                    [NSNumber numberWithInteger:kCellListKeyFrameLayer],
                    [NSNumber numberWithInteger:kCellListShapeLayer], nil];
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
    
    return [_listAry count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    NSInteger index = [[_listAry objectAtIndex:indexPath.row] integerValue];
    
    switch (index) {
            
        case kCellListKeyFrameLayer: {
            
            cell.textLabel.text = @"KeyFrameLayer";
        }
            break;
        case kCellListShapeLayer: {
            
            cell.textLabel.text = @"ShapeLayer";
        }
            break;

        default:
            break;
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = [[_listAry objectAtIndex:indexPath.row] integerValue];
    
    switch (index) {
            
        case kCellListKeyFrameLayer: {
            
            KeyFrameLayerViewController *vc = [[KeyFrameLayerViewController alloc] initWithNibName:@"KeyFrameLayerViewController" bundle:nil];
            vc.title = @"KeyFrameLayer";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case kCellListShapeLayer: {
            
            ShapeLayerViewController *vc = [[ShapeLayerViewController alloc] initWithNibName:@"ShapeLayerViewController" bundle:nil];
            vc.title = @"ShapeLayer";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            break;
        default:
            break;
    }
    
}

@end
