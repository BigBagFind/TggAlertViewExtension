//
//  UIViewController+TggAlertExtension.m
//  Alert&SheetDemo
//
//  Created by 铁哥的mbp on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

// 改变tintColor的私有属性
// [cancel setValue:[UIColor greenColor] forKey:@"titleTextColor"];


#import "UIViewController+TggAlertExtension.h"
#import <objc/runtime.h>


#pragma mark - UIAlertViewWithBlock
@interface UIAlertView (Block) <UIAlertViewDelegate>

/**
 *  展示alertView带Block
 *
 *  @param block 点击AlertView的block
 */
- (void)showWithBlock:(SuccessBlock)block;

@end

@implementation  UIAlertView(Block)

static void *AlertViewKey = &AlertViewKey;
- (void)showWithBlock:(SuccessBlock)block {
    if (block) {
        self.delegate = self;
        objc_setAssociatedObject(self, &AlertViewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    SuccessBlock block = objc_getAssociatedObject(self, &AlertViewKey);
    block(buttonIndex);
}

@end

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////




@implementation UIViewController (TggAlertExtension)


#pragma mark - 便利生产方法

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:nil
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:^(NSUInteger selectedIndex) {
                                   
                               }];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:nil
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}

- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:nil
                                    message:message
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:^(NSUInteger selectedIndex) {
                                   
                               }];
}

- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle
                           successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:nil
                                    message:message
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:^(NSUInteger selectedIndex) {
                                   
                               }];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                               actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}




#pragma mark - 基本生产方法
/**
 *  弹出AlertView，并且适配version8.0上下
 *
 *  @param mainTitle    顶部主要title提示
 *  @param message      需要表达的提示信息
 *  @param firTitle     第一个按钮的title
 *  @param secTitle     第二个按钮的title
 *  @param successBlock 点击按钮的成功回调
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                               firstTitle:(NSString *)firTitle
                              secondTitle:(NSString *)secTitle
                             successBlock:(SuccessBlock)successBlock {
    
    mainTitle = (mainTitle && mainTitle.length > 0) ? mainTitle : nil;
    message = (message && message.length > 0) ? message : nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:mainTitle message:message preferredStyle:1];
        
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:firTitle style:0 handler:^(UIAlertAction * _Nonnull action) {
            successBlock(0);
        }];
        
        
        [alertVc addAction:cancel];
        
        if (secTitle && secTitle.length > 0) {
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:secTitle style:0 handler:^(UIAlertAction * _Nonnull action) {
                successBlock(1);
            }];
            [alertVc addAction:confirm];
        }
        
        [self presentViewController:alertVc animated:YES completion:nil];
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:mainTitle message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:firTitle,(secTitle && secTitle.length > 0) ? secTitle : nil, nil];
        [alertView showWithBlock:^(NSUInteger selectedIndex) {
            successBlock(selectedIndex);
        }];

    }
}



@end












