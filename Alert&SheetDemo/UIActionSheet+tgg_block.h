//
//  UIActionSheet+tgg_block.h
//  喵喵
//
//  Created by 铁拳科技 on 16/8/8.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SucceedBlock)(NSUInteger selectedIndex);
@interface UIActionSheet (tgg_block)<UIActionSheetDelegate>



/**
 *  showActionSheet
 *
 *  @param view  superView
 *  @param block clickedBlock
 */
- (void)showInView:(UIView *)view
             Block:(SucceedBlock)block;

@end



