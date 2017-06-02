//
//  ListTableViewController.m
//  SimpleFrameAnimation
//
//  Created by YehHenChia on 2017/5/11.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ListTableViewController.h"

#import "TimerViewController.h"
#import "DisplayLinkViewController.h"
#import "DrawViewController.h"

typedef NS_ENUM(NSInteger, kListCell) {
    
    kListCellTimer = 0,
    kListCellDisplayLink,
    kListCellDraw,
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
                    [NSNumber numberWithInteger:kListCellTimer],
                    [NSNumber numberWithInteger:kListCellDisplayLink],
                    [NSNumber numberWithInteger:kListCellDraw], nil];
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
        
        case kListCellTimer: {
        
            cell.textLabel.text = @"Timer Animation";
        }
            break;
        case kListCellDisplayLink: {
            
            cell.textLabel.text = @"DisplayLink Animation";
        }
            break;
        case kListCellDraw: {
            
            cell.textLabel.text = @"Draw Animation";
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
            
        case kListCellTimer: {
            
            TimerViewController *timerVC = [[TimerViewController alloc] initWithNibName:@"TimerViewController" bundle:nil];
            
            timerVC.title = @"Timer Animation";
            
            [self.navigationController pushViewController:timerVC animated:YES];
        }
            break;
        case kListCellDisplayLink: {
            
            DisplayLinkViewController *displayLinkVC = [[DisplayLinkViewController alloc] initWithNibName:@"DisplayLinkViewController" bundle:nil];
            
            displayLinkVC.title = @"DisplayLink Animation";
            
            [self.navigationController pushViewController:displayLinkVC animated:YES];
        }
            break;
        case kListCellDraw: {
            
            DrawViewController *drawVC = [[DrawViewController alloc] initWithNibName:@"DrawViewController" bundle:nil];
            
            drawVC.title = @"Draw Animation";
            
            [self.navigationController pushViewController:drawVC animated:YES];

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
