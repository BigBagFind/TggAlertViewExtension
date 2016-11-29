//
//  TableViewController.m
//  Alert&SheetDemo
//
//  Created by 吴玉铁 on 2016/11/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TableViewController.h"
#import "UIViewController+TggAlertExtension.h"
#import <objc/runtime.h>

@interface TableViewController () 

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    UIAlertView *a = [[UIAlertView alloc] init];
    NSLog(@"********所有变量/值:\n%@", [self getAllIvar:a]);
    NSLog(@"********所有属性:\n%@", [self getAllProperty:a]);
     */
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.row) {
        case 0:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle" message:@"message,TwoAction" firstAction:@"first" secondAction:@"second" successBlock:^(NSUInteger selectedIndex) {
                NSLog(@"selectedIndex:%zd",selectedIndex);
            }];
            break;
        case 1:
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle"
                                            message:@"systemMessage,WithClickedBlock"
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
            [self tgg_presentAlertViewWithMessage:@"systemMessage,WithClickedBlock"
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
            [self tgg_presentAlertViewWithMainTitle:@"BoldTitle,WithClickedBlock"
                                        actionTitle:@"ok"
                                       successBlock:^(NSUInteger selectedIndex) {
                                           NSLog(@"ok clicked");
                                       }];
            break;
        default:
            break;
    }
    
    
}

//获得所有变量
- (NSArray *)getAllIvar:(id)object {
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *keyChar = ivar_getName(ivar);
        NSString *keyStr = [NSString stringWithCString:keyChar encoding:NSUTF8StringEncoding];
        @try {
            id valueStr = [object valueForKey:keyStr];
            NSDictionary *dic = nil;
            if (valueStr) {
                dic = @{keyStr : valueStr};
            } else {
                dic = @{keyStr : @"值为nil"};
            }
            [array addObject:dic];
        }
        @catch (NSException *exception) {}
    }
    return [array copy];
}

//获得所有属性
- (NSArray *)getAllProperty:(id)object {
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList([object class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *nameChar = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:nameChar encoding:NSUTF8StringEncoding];
        [array addObject:nameStr];
    }
    return [array copy];
}


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
