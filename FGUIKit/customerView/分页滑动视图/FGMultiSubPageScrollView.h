//
//  FGMultiSubPageScrollView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGMultiSubPageScrollView : UIView

@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIView * containView;
@property (nonatomic,copy) NSArray * containViews;
@property (nonatomic) NSInteger selectIndex;

- (void)setupWithSubViews:(NSArray *)subViews;
- (void)scrollToIndex:(NSInteger)index;
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animate;

@end

NS_ASSUME_NONNULL_END
