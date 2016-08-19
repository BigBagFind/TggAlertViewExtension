//
//  UIViewController+TggAlertExtension.h
//  Alert&SheetDemo
//
//  Created by 铁拳科技 on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SuccessBlock)(NSUInteger index);

@interface UIViewController (TggAlertExtension)



@end


@interface UIAlertView (Block)<UIAlertViewDelegate>

/**
 *  展示alertView带Block
 *
 *  @param block 点击AlertView的block
 */
- (void)showWithBlock:(SuccessBlock)block;



@end