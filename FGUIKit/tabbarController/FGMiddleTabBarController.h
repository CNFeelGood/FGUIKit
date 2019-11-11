//
//  FGMiddleTabBarController.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGMiddleTabBarController : UITabBarController

#pragma mark - set middle btn
/**
 *  用图片初始化中间特殊按钮
 */
- (void)setupMiddleBtnWithImage:(UIImage *)image;
/**
 *  将特殊按钮的中心放在tabbar的上边缘
 */
- (void)setupMiddleBtnToTop;
/**
 *  将特殊按钮的中心和tabbar的中心重合
 */
- (void)setupMiddleBtnToCenter;
/**
 *  设置特殊按钮超出tabbar的部分占特殊按钮自身高度的比例
 */
- (void)setupMiddleBtnOutPercent:(CGFloat)percent;
/**
 *  点击事件
 */
- (void)clickMiddleBtn:(void(^)(void))click;

@end

NS_ASSUME_NONNULL_END
