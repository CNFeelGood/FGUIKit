//
//  FGMiddleTabBar.h
//  SLive
//
//  Created by 肥儿古德 on 2019/7/26.
//  Copyright © 2019年 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGMiddleTabBar : UITabBar

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
#pragma mark - black line
/**
 *  移除黑线
 */
- (void)removeTopBlackLine;

@end

@interface FGMiddleConfig : NSObject

+ (instancetype)sharedInstance;

/**
 默认47
 */
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

NS_ASSUME_NONNULL_END
