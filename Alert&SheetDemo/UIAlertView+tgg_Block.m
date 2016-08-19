//
//  UIAlertView+tgg_Block.m
//  喵喵
//
//  Created by 铁拳科技 on 16/8/4.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import "UIAlertView+tgg_Block.h"
#import <objc/runtime.h>

static const char AlertKey;

@implementation UIAlertView (tgg_Block)



- (void)showWithBlock:(SuccessBlock)block{
    if (block) {
        self.delegate = self;
        objc_setAssociatedObject(self, &AlertKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    SuccessBlock block = objc_getAssociatedObject(self, &AlertKey);
    block(buttonIndex);
}



@end
