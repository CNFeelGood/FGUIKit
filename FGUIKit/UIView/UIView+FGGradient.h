//
//  UIView+FGGradient.h
//  CoolPower
//
//  Created by 肥儿古德 on 2019/4/19.
//  Copyright © 2019年 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FGGradient)

//做渐变色最好是另起一个底图view，先设置frame(0,0,width,height),然后调用填充渐变方法，此时渐变视图会生成在视图左上角。然后再跟底图view添加约束，约束到目标位置.

/**
 渐变色不生效的几种可能
 * 设置渐变色时，目标控件的frame为0
 * 设置渐变色时，设置的frame的起点不是左上定点，但是添加渐变色是按照左上定点作为参照来添加的
 */

/**
 为view填充指定frame的渐变色

 @param frame 范围
 @param colors UIColor颜色数组
 @param locations NSNumber数组，数值为0到1的浮点数，标识颜色分界点
 @param startPoint 渐变开始的点(可通过开始结束点调整渐变方向)
 @param endPoint 渐变结束的点(可通过开始结束点调整渐变方向)
 */
- (void)fillGradientWithFrame:(CGRect)frame colors:(NSArray <UIColor *>*)colors locations:(NSArray <NSNumber *>*)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 为view填满渐变色
 
 @param colors UIColor颜色数组
 @param locations NSNumber数组，数值为0到1的浮点数，标识颜色分界点
 @param startPoint 渐变开始的点(可通过开始结束点调整渐变方向)
 @param endPoint 渐变结束的点(可通过开始结束点调整渐变方向)
 */
- (void)fillGradientWithColors:(NSArray <UIColor *>*)colors locations:(NSArray <NSNumber *>*)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 快捷：在水平方向上填充渐变色,以颜色数据里的数据平分填充范围

 @param colors 颜色数组
 */
- (void)fillGradientHorizontalWithColors:(NSArray <UIColor *>*)colors;

/**
 快捷：在垂直方向上填充渐变色,以颜色数据里的数据平分填充范围

 @param colors 颜色数组
 */
- (void)fillGradientVerticalWithColors:(NSArray <UIColor *>*)colors;

@end

NS_ASSUME_NONNULL_END
