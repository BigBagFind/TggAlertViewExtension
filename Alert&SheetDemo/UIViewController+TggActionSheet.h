//
//  UIViewController+tgg_actionSheet.h
//  喵喵
//
//  Created by 铁哥的mbp on 16/8/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SucceedBlock)(NSUInteger selectedIndex);


@interface UIViewController (TggActionSheet)

/**
 *  presentActionSheetAdaptToiOSAllVersion
 *
 *  @param title         main title
 *  @param message       message
 *  @param contentTitles actionTitles
 *  @param block         SelectedBlock
 */
- (void)tgg_presentActionSheetWithTitle:(NSString *)title
                                message:(NSString *)message
                          contentTitles:(NSArray *)contentTitles
                          selectedBlock:(SucceedBlock)block;

@end



@interface UIActionSheet (actionSheetBlock)<UIActionSheetDelegate>

/**
 *  showActionSheet
 *
 *  @param view  superView
 *  @param block clickedBlock
 */
- (void)showInView:(UIView *)view
             block:(SucceedBlock)block;


@end












