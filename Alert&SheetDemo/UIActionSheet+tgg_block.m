//
//  UIActionSheet+tgg_block.m
//  喵喵
//
//  Created by 铁拳科技 on 16/8/8.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import "UIActionSheet+tgg_block.h"
#import <objc/runtime.h>


static void *ActionSheetKey = &ActionSheetKey;
@implementation UIActionSheet (tgg_block)

- (void)showInView:(UIView *)view
             Block:(SucceedBlock)block{
    if (block) {
        objc_setAssociatedObject(self, ActionSheetKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        self.delegate = self;
        [self showInView:view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    SucceedBlock block = objc_getAssociatedObject(self, ActionSheetKey);
    block(buttonIndex);
}

@end
