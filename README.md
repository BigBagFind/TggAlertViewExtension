#### AlertCategory，定义封装UIViewController的类目扩展，让API更简单，弹出UIAlertViewOrUIAlertController，适配version8.0上下
#### 如果有一点用的话，就来个Star吧

####[本文详解](http://www.jianshu.com/p/17f7099c2d5c)
####[本文对应文章](http://www.jianshu.com/p/17f7099c2d5c)
####[具体直接看这里](http://www.jianshu.com/p/17f7099c2d5c)

 
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
