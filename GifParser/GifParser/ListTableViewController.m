//
//  ListTableViewController.m
//  GifParser
//
//  Created by YehHenChia on 2017/5/12.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ListTableViewController.h"
#import "GifAnalysisVC.h"
#import "GifSynthesisVC.h"
#import "PlayGifVC.h"

typedef NS_ENUM(NSInteger, kListCell) {

    kListCellGifAnalysis = 0,
    kListCellGifSynthesis,
    kListCellGifPlay,
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
                    [NSNumber numberWithInteger:kListCellGifAnalysis],
                    [NSNumber numberWithInteger:kListCellGifSynthesis],
                    [NSNumber numberWithInteger:kListCellGifPlay],
                    nil];
    
    self.title = @"目錄";
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
        
        case kListCellGifAnalysis: {
        
            cell.textLabel.text = @"Gif Analysis";
        }
            break;
        case kListCellGifSynthesis:{
            
            cell.textLabel.text = @"Gif Synthesis";
        }
            break;
        case kListCellGifPlay: {
            
            cell.textLabel.text = @"Gif play";
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
            
        case kListCellGifAnalysis: {
            
            GifAnalysisVC *gifAnalysisVC = [[GifAnalysisVC alloc] initWithNibName:@"GifAnalysisVC" bundle:nil];
            gifAnalysisVC.title = @"Gif Analysis";
            [self.navigationController pushViewController:gifAnalysisVC animated:YES];
        }
            break;
        case kListCellGifSynthesis:{
            
            GifSynthesisVC *gifSynthesisVC = [[GifSynthesisVC alloc] initWithNibName:@"GifSynthesisVC" bundle:nil];
            gifSynthesisVC.title = @"Gif Synthesis";
            [self.navigationController pushViewController:gifSynthesisVC animated:YES];
        }
            break;
        case kListCellGifPlay: {
            
            PlayGifVC *playGifVC = [[PlayGifVC alloc] initWithNibName:@"PlayGifVC" bundle:nil];
            playGifVC.title = @"Play Gif";
            [self.navigationController pushViewController:playGifVC animated:YES];

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
