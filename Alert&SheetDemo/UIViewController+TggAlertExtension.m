//
//  UIViewController+TggAlertExtension.m
//  Alert&SheetDemo
//
//  Created by 铁拳科技 on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "UIViewController+TggAlertExtension.h"
#import <objc/runtime.h>


#pragma mark - 封装弹出的AlertView且适配版本
@implementation UIViewController (TggAlertExtension)

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
                            SuccessBlock:(SuccessBlock)successBlock{
    
}



@end


#pragma mark - UIAlertViewWithBlock
@implementation  UIAlertView(Block)
static void *AlertViewKey = &AlertViewKey;
- (void)showWithBlock:(SuccessBlock)block{
    if (block) {
        self.delegate = self;
        objc_setAssociatedObject(self, &AlertViewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    SuccessBlock block = objc_getAssociatedObject(self, &AlertViewKey);
    block(buttonIndex);
}

@end









