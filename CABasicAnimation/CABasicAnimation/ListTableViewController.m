//
//  ListTableViewController.m
//  CABasicAnimation
//
//  Created by YehHenChia on 2017/5/16.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ListTableViewController.h"

#import "TranslateAnimationVC.h"
#import "ScaleAnimationVC.h"
#import "RotationViewController.h"
#import "CornerRadiusAnimationVC.h"
#import "BorderAnimationVC.h"
#import "ColorOpacityAnimationVC.h"
#import "ShadowOffsetAnimaitonVC.h"

typedef NS_ENUM(NSInteger, kCellList)
{
    kCellListTransalte = 0,
    kCellListScale,
    kCellListRotation,
    kCellListCornerRadius,
    kCellListBorder,
    kCellListColorOpacity,
    kCellListShadowOffset,
};

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *listAry;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.listAry = [NSArray arrayWithObjects:
                    [NSNumber numberWithInteger:kCellListTransalte],
                    [NSNumber numberWithInteger:kCellListScale],
                    [NSNumber numberWithInteger:kCellListRotation],
                    [NSNumber numberWithInt:kCellListCornerRadius],
                    [NSNumber numberWithInt:kCellListBorder],
                    [NSNumber numberWithInt:kCellListColorOpacity],
                    [NSNumber numberWithInt:kCellListShadowOffset], nil];
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
        
        case kCellListTransalte: {
            
            cell.textLabel.text = @"Translate";
        }
            break;
        case kCellListScale: {
            
            cell.textLabel.text = @"Scale";
        }
            break;
        case kCellListRotation: {
            
            cell.textLabel.text = @"Rotation";
        }
            break;
        case kCellListCornerRadius: {
            
            cell.textLabel.text = @"Corner Radius";
        }
            break;
        case kCellListBorder: {
            
            cell.textLabel.text = @"Border";
        }
            break;
        case kCellListColorOpacity: {
            
            cell.textLabel.text = @"ColorOpacity";
        }
            break;
        case kCellListShadowOffset: {
            
            cell.textLabel.text = @"ShadowOffset";
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
            
        case kCellListTransalte: {
            
            TranslateAnimationVC *transalteVC = [[TranslateAnimationVC alloc] initWithNibName:@"TranslateAnimationVC" bundle:nil];
            transalteVC.title = @"Translate Animation";
            [self.navigationController pushViewController:transalteVC animated:YES];
        }
            break;
        case kCellListScale: {
            
            ScaleAnimationVC *scaleVC = [[ScaleAnimationVC alloc] initWithNibName:@"ScaleAnimationVC" bundle:nil];
            scaleVC.title = @"Scale Animation";
            [self.navigationController pushViewController:scaleVC animated:YES];
        }
            break;
        case kCellListRotation: {
            
            RotationViewController *rotationVC = [[RotationViewController alloc] initWithNibName:@"RotationViewController" bundle:nil];
            rotationVC.title = @"Rotation Animation";
            [self.navigationController pushViewController:rotationVC animated:YES];
        }
            break;
        case kCellListCornerRadius: {
            
            CornerRadiusAnimationVC *cornerRadiusVC = [[CornerRadiusAnimationVC alloc] initWithNibName:@"CornerRadiusAnimationVC" bundle:nil];
            cornerRadiusVC.title = @"CornerRadius Animation";
            [self.navigationController pushViewController:cornerRadiusVC animated:YES];
        }
            break;
        case kCellListBorder: {
            
            BorderAnimationVC *borderAnimationVC = [[BorderAnimationVC alloc] initWithNibName:@"BorderAnimationVC" bundle:nil];
            borderAnimationVC.title = @"Border Animation";
            [self.navigationController pushViewController:borderAnimationVC animated:YES];
        }
            break;
        case kCellListColorOpacity: {
            
            ColorOpacityAnimationVC *colorOpacityAnimationVC = [[ColorOpacityAnimationVC alloc] initWithNibName:@"ColorOpacityAnimationVC" bundle:nil];
            colorOpacityAnimationVC.title = @"ColorOpacity Animation";
            [self.navigationController pushViewController:colorOpacityAnimationVC animated:YES];
        }
            break;
        case kCellListShadowOffset: {
            
            ShadowOffsetAnimaitonVC *shadowOffsetVC = [[ShadowOffsetAnimaitonVC alloc] initWithNibName:@"ShadowOffsetAnimaitonVC" bundle:nil];
            shadowOffsetVC.title = @"ShadowOffset Animation";
            [self.navigationController pushViewController:shadowOffsetVC animated:YES];
        }
            break;
        default:
            break;
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
