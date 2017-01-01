//
//  UIViewController+TggAlertExtension.m
//  Alert&SheetDemo
//
//  Created by 铁哥的mbp on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 *  现在需求一般就这两种
 *  默认第一种
 */
typedef NS_ENUM(NSUInteger, TggAlertMessageTextAlimentStyle) {
    TggMessageTextAlimentStyleDefault = 0,
    TggMessageTextAlimentStyleLeft = 1,
    TggMessageTextAlimentStyleCenter = 2
};

typedef void(^SuccessBlock)(NSUInteger selectedIndex);


@interface UIViewController (TggAlertExtension)


#pragma mark - 一上一下:不带Block和带Block

/**
 *  弹出AlertView就一个action，无message无block
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle;

/**
 *  弹出AlertView就一个action，无message
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock;

/**
 *  弹出AlertView就一个action，无title无block
 */
- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle;

/**
 *  弹出AlertView就一个action，无title
 */
- (void)tgg_presentAlertViewWithMessage:(NSString *)message
                            actionTitle:(NSString *)actionTitle
                           successBlock:(SuccessBlock)successBlock;

/**
 *  弹出AlertView就一个action没有block
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              actionTitle:(NSString *)actionTitle;

/**
 *  弹出AlertView就一个action的基础方法，带block回调
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock;

/**
 *  弹出AlertView的基本方法,最多2个action
 *
 *  @param mainTitle      顶部title
 *  @param message        主要的message
 *  @param firstAction    第一个actionTitle
 *  @param secondAction   第二个actionTitle
 *  @param successBlock 点击成功的回调
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                                  message:(NSString *)message
                              firstAction:(NSString *)firstAction
                             secondAction:(NSString *)secondAction
                             successBlock:(SuccessBlock)successBlock;


#pragma mark - Message左对齐显示样式
/**
 *  弹出AlertView就一个action的基础方法
 *  message左对齐
 *  带block回调
 */
- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                          TextLeftMessage:(NSString *)message
                              actionTitle:(NSString *)actionTitle
                             successBlock:(SuccessBlock)successBlock;


- (void)tgg_presentAlertViewWithMainTitle:(NSString *)mainTitle
                          TextLeftMessage:(NSString *)message
                              firstAction:(NSString *)firstAction
                             secondAction:(NSString *)secondAction
                             successBlock:(SuccessBlock)successBlock;


@end


