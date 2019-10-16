//
//  FGFloatView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/15.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGFloatView : UIView

- (void)clickCancelBlock:(void(^)(void))cancel;

- (void)show;

- (void)dismiss;

- (void)setupBackgroundAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
