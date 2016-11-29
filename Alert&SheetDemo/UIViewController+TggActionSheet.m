//
//  UIViewController+tgg_actionSheet.m
//  喵喵
//
//  Created by 铁哥的mbp on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "UIViewController+TggActionSheet.h"
#import <objc/runtime.h>

#define TggRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define TggNavBarColor              TggRGBColor(36, 171, 27)


#pragma mark - 为UIViewController扩展弹窗视图
static void *TggActionSheetKey = &TggActionSheetKey;
@implementation UIViewController (TggActionSheet)

/** 弹出ActionSheet同时适配iOS8.0上下 */
- (void)tgg_presentActionSheetWithTitle:(NSString *)title
                                message:(NSString *)message
                          contentTitles:(NSArray *)contentTitles
                          selectedBlock:(SucceedBlock)block {
    // 大于8.0弹出AlertController
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
    
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        alertVc.view.tintColor = TggNavBarColor;
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertVc addAction:cancel];
        
        [contentTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                block(idx);
            }];
            [alertVc addAction:alertAction];
        }];
        
        [self presentViewController:alertVc animated:YES completion:nil];
        
    // 小于8.0弹出ActionSheet
    } else {
        
        // 拼接title和message,用空格隔开
        NSString *finalTitle;
        if (title && title.length > 0 && message.length > 0 && message) {
            finalTitle = [NSString stringWithFormat:@"%@ %@",title,message];
        } else if (title && title.length > 0 && (message.length == 0 || !message)) {
            finalTitle = title;
        } else if ((!title || title.length == 0) && message.length > 0 && message) {
            finalTitle = message;
        }
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:finalTitle ? finalTitle : nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        
        [contentTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [actionSheet addButtonWithTitle:obj];
        }];
        
        [actionSheet addButtonWithTitle:@"取消"];
        actionSheet.cancelButtonIndex = contentTitles.count;
        [actionSheet dismissWithClickedButtonIndex:contentTitles.count animated:YES];
        
        [actionSheet showInView:self.tabBarController.view ? self.tabBarController.view : self.navigationController.view ? self.navigationController.view : self.view block:^(NSUInteger selectedIndex) {
            if (selectedIndex != contentTitles.count) {
                block(selectedIndex);
            }
        }];
    }
}

@end


#pragma mark - 为ActionSheet扩展Block
static void *ActionSheetKey = &ActionSheetKey;
@implementation UIActionSheet (actionSheetBlock)

/** 展示UIActionSheet同带block */
- (void)showInView:(UIView *)view
             block:(SucceedBlock)block {
    if (block) {
        objc_setAssociatedObject(self, ActionSheetKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        self.delegate = self;
        [self showInView:view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    SucceedBlock block = objc_getAssociatedObject(self, ActionSheetKey);
    block(buttonIndex);
}


@end

