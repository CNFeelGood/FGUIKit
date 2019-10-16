//
//  FGFloatView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/15.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGFloatView.h"

@interface FGFloatView ()

@property (nonatomic,strong) UIButton * backgroundButton;
@property (nonatomic,copy) void(^cancelBP)(void);

@end

@implementation FGFloatView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backgroundButton.backgroundColor = [UIColor blackColor];
        self.backgroundButton.alpha = .3;
        [self addSubview:self.backgroundButton];
        self.backgroundButton.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.backgroundButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
        NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.backgroundButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
        NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.backgroundButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
        NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.backgroundButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
        [self.backgroundButton addTarget:self action:@selector(pri_clickCancel:) forControlEvents:UIControlEventTouchUpInside];
        [self addConstraints:@[leftCon,rightCon,topCon,bottomCon]];
    }
    return self;
}
- (void)show{
    self.hidden = NO;
}
- (void)dismiss{
    self.hidden = YES;
}
- (void)setupBackgroundAlpha:(CGFloat)alpha{
    if (alpha < .05) alpha = .05;
    self.backgroundButton.alpha = alpha;
}
- (void)pri_clickCancel:(id)sender{
    if (self.cancelBP) {
        self.cancelBP();
    }else{
        [self dismiss];
    }
}
- (void)clickCancelBlock:(void (^)(void))cancel{
    self.cancelBP = cancel;
}

@end
