//
//  UIAlertView+tgg_Block.h
//  喵喵
//
//  Created by 铁拳科技 on 16/8/4.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(NSInteger index);

@interface UIAlertView (tgg_Block)<UIAlertViewDelegate>


- (void)showWithBlock:(SuccessBlock)block;


@end
