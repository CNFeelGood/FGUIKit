//
//  FGImgLabViews.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGImgLabViews : UIView

/**
 垂直方向计数（行数）,内部item生成后更改无效
 */
@property (nonatomic) NSUInteger verticalCount;
- (FGImgLabViews *(^)(NSUInteger))fgp_verticalCount;

/**
 水平方向计数（每行个数），内部item生成后更改无效
 */
@property (nonatomic) NSUInteger horizontalCount;
- (FGImgLabViews *(^)(NSUInteger))fgp_horizontalCount;

/**
 每一个item图片距离上方的高度，默认8
 */
@property (nonatomic) CGFloat topHeight;
- (FGImgLabViews *(^)(CGFloat))fgp_topHeight;

/**
 每一个item图片宽度，默认50
 */
@property (nonatomic) CGFloat imgWidth;
- (FGImgLabViews *(^)(CGFloat))fgp_imgWidth;

/**
 每一个item图片高度，默认50
 */
@property (nonatomic) CGFloat imgHeight;
- (FGImgLabViews *(^)(CGFloat))fgp_imgHeight;

/**
 每一个item图片和label的间距，默认8
 */
@property (nonatomic) CGFloat middleHeight;
- (FGImgLabViews *(^)(CGFloat))fgp_middleHeight;

/**
 每一个item里label的font，默认系统15号字体,修改可以即时生效
 */
@property (nonatomic,strong) UIFont * font;
- (FGImgLabViews *(^)(UIFont *))fgp_font;

/**
 每一个item里label的文字颜色，默认黑色,修改可以即时生效
 */
@property (nonatomic,strong) UIColor * color;
- (FGImgLabViews *(^)(UIColor *))fgp_color;

/**
 所有的图片集合,修改可以即时生效
 */
@property (nonatomic,copy) NSArray * images;
- (FGImgLabViews *(^)(NSArray *))fgp_images;

/**
 所有的标题集合,修改可以即时生效
 */
@property (nonatomic,copy) NSArray * titles;
- (FGImgLabViews *(^)(NSArray *))fgp_titles;

/**
 响应点击，并返回点击的index

 @param block 响应点击的block
 */
- (void)tapItemBlock:(void(^)(NSInteger index))block;

@end

NS_ASSUME_NONNULL_END
