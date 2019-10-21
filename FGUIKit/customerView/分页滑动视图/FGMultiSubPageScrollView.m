//
//  FGMultiSubPageScrollView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGMultiSubPageScrollView.h"

@implementation FGMultiSubPageScrollView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupScrollView];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupScrollView];
    }
    return self;
}
- (void)setupScrollView{
    self.scrollView = [UIScrollView new];
    [self addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
    NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
    NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
    [self addConstraints:@[leftCon,rightCon,topCon,bottomCon]];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = NO;
}
- (void)setupWithSubViews:(NSArray *)subViews{
    self.containViews = subViews;
    self.containView = [UIView new];
    [self.scrollView addSubview:self.containView];
//    [self.scrollView setContentSize:CGSizeMake(self.frame.size.width * subViews.count, self.frame.size.height)];
    self.containView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
    NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
    NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
    NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1.*subViews.count constant:0.];
    NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:self.containView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1. constant:0.];
    [self.scrollView addConstraints:@[leftCon,rightCon,topCon,bottomCon,widthCon,heightCon]];
    for (NSInteger i = 0; i < self.containViews.count; i ++) {
        UIView * view = self.containViews[i];
        [self.containView addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.containView attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
        NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.containView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
        NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.containView attribute:NSLayoutAttributeLeft multiplier:1. constant:[UIScreen mainScreen].bounds.size.width * i];
        [self.containView addConstraints:@[topCon,bottomCon,widthCon,leftCon]];
    }
}
- (void)scrollToIndex:(NSInteger)index{
    [self scrollToIndex:index animated:YES];
}
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animate{
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * index, 0) animated:animate];
}

@end
