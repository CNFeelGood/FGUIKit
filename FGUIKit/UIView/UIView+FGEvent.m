//
//  UIView+FGEvent.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UIView+FGEvent.h"
#import <objc/runtime.h>

@implementation UIView (FGEvent)

@dynamic fg_tapBP,fg_longPressBP;

static char tapKey;
static char longPressKey;

#pragma mark - tap
- (void)fg_tapTarget:(id)target action:(SEL)selector{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self setUserInteractionEnabled:YES];
    [self addGestureRecognizer:tap];
}
- (void)fg_tapBlock:(void (^)(void))block{
    self.fg_tapBP = block;
    [self setUserInteractionEnabled:YES];
    [self fg_tapTarget:self action:@selector(tapEvent)];
}
- (void)tapEvent{
    if (self.fg_tapBP) {
        self.fg_tapBP();
    }
}
- (void (^)(void))fg_tapBP{
    return objc_getAssociatedObject(self, &tapKey);
}
- (void)setFg_tapBP:(void (^)(void))fg_tapBP{
    objc_setAssociatedObject(self, &tapKey, fg_tapBP, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark - long press
- (void)fg_longPressTarget:(id)target action:(SEL)selector{
    UILongPressGestureRecognizer * press = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selector];
    press.minimumPressDuration = 0.8;
    [self addGestureRecognizer:press];
}
- (void)fg_longPressBlock:(void (^)(void))block{
    self.fg_longPressBP = block;
    [self setUserInteractionEnabled:YES];
    [self fg_longPressTarget:self action:@selector(longPressEvent:)];
}
- (void)longPressEvent:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        if (self.fg_longPressBP) {
            self.fg_longPressBP();
        }
    }
}
- (void (^)(void))fg_longPressBP{
    return objc_getAssociatedObject(self, &longPressKey);
}
- (void)setFg_longPressBP:(void (^)(void))fg_longPressBP{
    objc_setAssociatedObject(self, &longPressKey, fg_longPressBP, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
