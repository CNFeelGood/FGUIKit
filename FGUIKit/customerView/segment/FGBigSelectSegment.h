//
//  FGBigSelectSegment.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/21.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGBigSelectSegment : UIView

@property (nonatomic,copy) UIColor * defaultColor;
- (FGBigSelectSegment *(^)(UIColor *))fgp_defaultColor;
@property (nonatomic,copy) UIColor * highlightColor;
- (FGBigSelectSegment *(^)(UIColor *))fgp_highlightColor;
@property (nonatomic,copy) UIFont * defaultFont;
- (FGBigSelectSegment *(^)(UIFont *))fgp_defaultFont;
@property (nonatomic,copy) UIFont * highlightFont;
- (FGBigSelectSegment *(^)(UIFont *))fgp_highlightFont;
@property (nonatomic,copy) NSArray * titles;
- (FGBigSelectSegment *(^)(NSArray *))fgp_titles;
//调用此方法开始布局
- (FGBigSelectSegment *(^)(void))fgp_setupUI;

@property (nonatomic,copy,readonly) NSArray * labels;
@property (nonatomic) NSInteger index;
@property (nonatomic,copy) void(^tapItemBP)(NSInteger index);
- (void)tapItemBlock:(void(^)(NSInteger index))block;

@end

NS_ASSUME_NONNULL_END
