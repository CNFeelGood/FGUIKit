//
//  FGSegmentSubsView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/22.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGSegmentSubsView.h"

@implementation FGSegmentSubsView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupFGSegmentSubsViewUI];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupFGSegmentSubsViewUI];
    }
    return self;
}
- (void)setupFGSegmentSubsViewUI{
    self.segment = [FGSegment new];
    [self addSubview:self.segment];
    self.bottomView = [FGMultiSubPageScrollView new];
    [self addSubview:self.bottomView];
}

- (void)setupConstraitWithSegmentHeight:(CGFloat)height middleMargin:(CGFloat)margin{
    [self setupSegmentConstraintWithHeight:height];
    [self setupBottomViewConstraintWithMargin:margin];
}
- (void)setupSegmentConstraintWithHeight:(CGFloat)height{
    self.segment.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.segment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
    NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.segment attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.segment attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
    NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:self.segment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:height];
    [self addConstraints:@[leftCon,rightCon,topCon,heightCon]];
}
- (void)setupBottomViewConstraintWithMargin:(CGFloat)margin{
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.bottomView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
    NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.bottomView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
    NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.bottomView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.bottomView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.segment attribute:NSLayoutAttributeBottom multiplier:1. constant:margin];
    [self addConstraints:@[leftCon,rightCon,bottomCon,topCon]];
}

- (void)clickIndexBlock:(void (^)(NSInteger))block{
    [self.segment clickIndexBlock:^(NSInteger index) {
        [self.bottomView scrollToIndex:index];
        block(index);
    }];
}

@end
