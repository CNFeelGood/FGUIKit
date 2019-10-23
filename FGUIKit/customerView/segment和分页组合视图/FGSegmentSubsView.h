//
//  FGSegmentSubsView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/22.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGSegment.h"
#import "FGMultiSubPageScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FGSegmentSubsView : UIView

@property (nonatomic,strong) FGSegment * segment;
@property (nonatomic,strong) FGMultiSubPageScrollView * bottomView;

- (void)setupConstraitWithSegmentHeight:(CGFloat)height middleMargin:(CGFloat)margin;
//调用此方法，可使bottomview联动segment的点击，并得到回调的index
- (void)clickIndexBlock:(void(^)(NSInteger index))block;

@end

NS_ASSUME_NONNULL_END
