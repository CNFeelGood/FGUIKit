//
//  FGSegment.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/21.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGSegment : UIView

@property (nonatomic,strong) NSMutableArray * btnArray;
@property (nonatomic,strong) UIView * sliderView;
@property (nonatomic,strong) NSMutableArray * cutLineArray;
//菜单选项
@property (nonatomic,copy) NSArray * titles;
- (FGSegment *(^)(NSArray *))fgp_titles;
@property (nonatomic,strong) UIFont * titleFont;
- (FGSegment *(^)(UIFont *))fgp_titleFont;
@property (nonatomic,strong) UIColor * textDefaultColor;
- (FGSegment *(^)(UIColor *))fgp_textDefaultColor;
@property (nonatomic,strong) UIColor * textSelectedColor;
- (FGSegment *(^)(UIColor *))fgp_textSelectedColor;
//滑块
@property (nonatomic,strong) UIColor * sliderColor;
- (FGSegment *(^)(UIColor *))fgp_sliderColor;
@property (nonatomic) CGFloat sliderPercent;
- (FGSegment *(^)(CGFloat))fgp_sliderPercent;
@property (nonatomic) CGFloat sliderHeight;
- (FGSegment *(^)(CGFloat))fgp_sliderHeight;
//分割线
@property (nonatomic,strong) UIColor * cutLineColor;
- (FGSegment *(^)(UIColor *))fgp_cutLineColor;
@property (nonatomic) CGFloat cutLineWidth;
- (FGSegment *(^)(CGFloat))fgp_cutLineWidth;
@property (nonatomic) CGFloat cutLineHeightPercent;
- (FGSegment *(^)(CGFloat))fgp_cutLineHeightPercent;
//选中的tag
@property (nonatomic) NSInteger selectIndex;
- (FGSegment *(^)(NSInteger))fgp_selectIndex;
@property (nonatomic) CGFloat animateTime;
- (FGSegment *(^)(CGFloat))fgp_animateTime;
//图片代替文字
@property (nonatomic,copy) NSArray * defaultImages;
- (FGSegment *(^)(NSArray *))fgp_defaultImages;
@property (nonatomic,copy) NSArray * selectedImages;
- (FGSegment *(^)(NSArray *))fgp_selectedImages;
//block回调
@property (nonatomic,copy) void(^clickIndexBP)(NSInteger index);
- (void)clickIndexBlock:(void(^)(NSInteger))block;

//所有参数设置好之后，调用此方法进行布局
- (FGSegment *(^)(void))fgp_setupUI;
//如果slider初始化时不是左边第一个位置并且有问题的话，调用此方法解决
- (void)updateSlider;

@end

NS_ASSUME_NONNULL_END
