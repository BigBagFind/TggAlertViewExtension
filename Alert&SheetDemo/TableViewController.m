//
//  TableViewController.m
//  Alert&SheetDemo
//
//  Created by 吴玉铁 on 2016/11/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TableViewController.h"
#import "UIViewController+TggAlertExtension.h"

@interface TableViewController () 

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.row) {
        case 0:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                            message:@"systemMessage"
                                         firstTitle:@"first"
                                        secondTitle:@"second"
                                       successBlock:^(NSUInteger selectedIndex) {
                NSLog(@"selectedIndex: %zd", selectedIndex);
                                       }];
            break;
        case 1:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                            message:@"systemMessage"
                                        actionTitle:@"ok"
                                       successBlock:^(NSUInteger selectedIndex) {
                                           NSLog(@"ok clicked");
                                       }];
            break;
        case 2:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                            message:@"systemMessage"
                                        actionTitle:@"ok"];
            break;
        case 3:
            [self tgg_presentAlertViewWithMessage:@"systemMessage"
                                        actionTitle:@"ok"
                                       successBlock:^(NSUInteger selectedIndex) {
                                           NSLog(@"ok clicked");
                                       }];
            break;
        case 4:
            [self tgg_presentAlertViewWithMessage:@"systemMessage"
                                      actionTitle:@"ok"
                                     successBlock:^(NSUInteger selectedIndex) {
                                         NSLog(@"ok clicked");
                                     }];
            break;
        case 5:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                        actionTitle:@"ok"];
            break;
        case 6:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                        actionTitle:@"ok"
                                       successBlock:^(NSUInteger selectedIndex) {
                                           NSLog(@"ok clicked");
                                       }];
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
