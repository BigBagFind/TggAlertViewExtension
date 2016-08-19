//
//  ViewController.m
//  Alert&SheetDemo
//
//  Created by 铁拳科技 on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+TggActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)action:(id)sender {
    [self tgg_presentActionSheetWithTitle:@"哈哈哈" message:nil contentTitles:@[@"1",@"2",@"3"] selectedBlock:^(NSUInteger selectedIndex) {
        NSLog(@"%zd",selectedIndex);
        NSLog(@"%zd",selectedIndex);
        NSLog(@"%zd",selectedIndex);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
