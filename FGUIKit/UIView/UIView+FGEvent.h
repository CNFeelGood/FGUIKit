//
//  UIView+FGEvent.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FGEvent)

- (void)fg_tapTarget:(id)target action:(SEL)selector;
- (void)fg_longPressTarget:(id)target action:(SEL)selector;

- (void)fg_tapBlock:(void(^)(void))block;
- (void)fg_longPressBlock:(void(^)(void))block;

@property (nonatomic,copy) void(^fg_tapBP)(void);
@property (nonatomic,copy) void(^fg_longPressBP)(void);

@end

NS_ASSUME_NONNULL_END
