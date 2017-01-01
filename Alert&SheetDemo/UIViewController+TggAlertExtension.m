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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
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

#pragma clang diagnostic pop

@end

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////




@implementation UIViewController (TggAlertExtension)


#pragma mark - 左对齐Message显示样式
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                          TextLeftMessage:(NSString *)message
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleLeft
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                          TextLeftMessage:(NSString *)message
                              firstAction:(NSString *)firstAction
                             secondAction:(NSString *)secondAction
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleLeft
                                 firstTitle:firstAction
                                secondTitle:secondAction
                               successBlock:successBlock];
}


#pragma mark - PublicMethod

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:nil
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:nil];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:nil
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}

- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:nil
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:nil];
}

- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle
                           successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:nil
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              actionTitle:(NSString *)actionTitle {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:nil];
}

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                               actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:actionTitle
                                secondTitle:nil
                               successBlock:successBlock];
}



- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              firstAction:(NSString *)firstAction
                             secondAction:(NSString *)secondAction
                             successBlock:(SuccessBlock)successBlock {
    [self tgg_presentAlertViewWithMainTitle:mainTitle
                                    message:message
                    messageTextAlimentStyle:TggMessageTextAlimentStyleDefault
                                 firstTitle:firstAction
                                secondTitle:secondAction
                               successBlock:successBlock];
}


#pragma mark - PrivateMethod

- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                  messageTextAlimentStyle:(TggAlertMessageTextAlimentStyle)alimentStyle
                               firstTitle:(NSString *)firTitle
                              secondTitle:(NSString *)secTitle
                             successBlock:(SuccessBlock)successBlock {
    
    mainTitle = (mainTitle && mainTitle.length > 0) ? mainTitle : nil;
    message = (message && message.length > 0) ? message : nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:mainTitle message:message preferredStyle:1];
        
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:firTitle style:0 handler:^(UIAlertAction * _Nonnull action) {
            if (successBlock) {
                successBlock(0);
            }
        }];
        
        
        [alertVc addAction:cancel];
        
        if (secTitle && secTitle.length > 0) {
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:secTitle style:0 handler:^(UIAlertAction * _Nonnull action) {
                if (successBlock) {
                    successBlock(1);
                }
            }];
            [alertVc addAction:confirm];
        }
        
        if (message.length > 0) {
            NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
            if (alimentStyle == 1) {
                NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
                [ps setAlignment:NSTextAlignmentLeft];
                [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:ps range:NSMakeRange(0, message.length)];
            }
            if (mainTitle.length == 0) {
                [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, message.length)];
            }
            [alertVc setValue:alertControllerMessageStr forKey:@"attributedMessage"];
        }
        
        [self presentViewController:alertVc animated:YES completion:nil];
        
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:mainTitle message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:firTitle, (secTitle.length > 0) ? secTitle : nil, nil];
        
        UIAlertController *alertVc = [alertView valueForKey:@"alertController"];
        NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
        if (alimentStyle == 1) {
            NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
            [ps setAlignment:NSTextAlignmentLeft];
            [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:ps range:NSMakeRange(0, message.length)];
        }
        if (mainTitle.length == 0) {
            [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, message.length)];
        }
        [alertVc setValue:alertControllerMessageStr forKey:@"attributedMessage"];
        
        [alertView showWithBlock:^(NSUInteger selectedIndex) {
            if (successBlock) {
                successBlock(selectedIndex);
            }
        }];
#pragma clang diagnostic pop
    }
}





@end












