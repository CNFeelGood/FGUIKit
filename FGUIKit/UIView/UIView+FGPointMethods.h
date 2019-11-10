//
//  UIView+FGPointMethods.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FGPointMethods)

/**
 传值小于0，取消边界切割，大于等于0，开启边界切割
 */
- (UIView *(^)(CGFloat))fgp_cornerRadius;
- (UIView *(^)(CGFloat))fgp_borderWidth;
- (UIView *(^)(UIColor *))fgp_borderColor;
- (UIView *(^)(NSInteger))fgp_tag;
- (UIView *(^)(CGRect))fgp_frame;
- (UIView *(^)(CGRect))fgp_bounds;
- (UIView *(^)(CGPoint))fgp_center;
- (UIView *(^)(UIColor *))fgp_backgroundColor;
- (UIView *(^)(CGFloat))fgp_alpha;
- (UIView *(^)(BOOL))fgp_hidden;


@end

NS_ASSUME_NONNULL_END
