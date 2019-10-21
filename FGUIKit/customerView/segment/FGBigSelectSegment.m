//
//  FGBigSelectSegment.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/21.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGBigSelectSegment.h"
#import "UIView+FGEvent.h"

@implementation FGBigSelectSegment

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupFGBigSelectSegmentConfig];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupFGBigSelectSegmentConfig];
}
#pragma mark - config
- (void)setupFGBigSelectSegmentConfig{
    self.fgp_defaultColor([UIColor grayColor])
    .fgp_highlightColor([UIColor blackColor])
    .fgp_defaultFont([UIFont systemFontOfSize:14])
    .fgp_highlightFont([UIFont systemFontOfSize:18])
    .fgp_titles(@[@"1",@"2",@"3"]);
}
#pragma mark - 点语法
- (FGBigSelectSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_defaultColor{
    return ^(UIColor * defaultColor){
        self.defaultColor = defaultColor;
        return self;
    };
}
- (FGBigSelectSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_highlightColor{
    return ^(UIColor * highlightColor){
        self.highlightColor = highlightColor;
        return self;
    };
}
- (FGBigSelectSegment * _Nonnull (^)(UIFont * _Nonnull))fgp_defaultFont{
    return ^(UIFont * defaultFont){
        self.defaultFont = defaultFont;
        return self;
    };
}
- (FGBigSelectSegment * _Nonnull (^)(UIFont * _Nonnull))fgp_highlightFont{
    return ^(UIFont * highlightFont){
        self.highlightFont = highlightFont;
        return self;
    };
}
- (FGBigSelectSegment * _Nonnull (^)(NSArray * _Nonnull))fgp_titles{
    return ^(NSArray * titles){
        self.titles = titles;
        return self;
    };
}
- (FGBigSelectSegment * _Nonnull (^)(void))fgp_setupUI{
    return ^(void){
        [self setupUI];
        return self;
    };
}
#pragma mark - setup
- (void)setupUI{
    if (self.subviews.count > 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    NSMutableArray * muts = [NSMutableArray new];
    for (NSInteger i  = 0; i < self.titles.count; i ++) {
        UILabel * label = [UILabel new];
        [self addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        if (i == 0) {
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
            NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
            NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
            NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1./self.titles.count constant:0.];
            [self addConstraints:@[leftCon,topCon,bottomCon,widthCon]];
        }else{
            UILabel * lastLabel = muts.lastObject;
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lastLabel attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
            NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
            NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
            NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastLabel attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
            [self addConstraints:@[leftCon,topCon,bottomCon,widthCon]];
        }
        [muts addObject:label];
        //设置属性
        label.tag = i;
        label.text = self.titles[i];
        label.font = self.defaultFont;
        label.textColor = self.defaultColor;
        label.textAlignment = NSTextAlignmentCenter;
        if (label.tag == self.index) {
            label.textColor = self.highlightColor;
            label.font = self.highlightFont;
        }
        [label fg_tapBlock:^{
            if (label.tag == self.index) {
                return ;
            }
            UILabel * lastLabel = self.labels[self.index];
            lastLabel.textColor = self.defaultColor;
            lastLabel.font = self.defaultFont;
            
            self.index = label.tag;
            label.textColor = self.highlightColor;
            label.font = self.highlightFont;
            
            if (self.tapItemBP) {
                self.tapItemBP(label.tag);
            }
        }];
    }
    _labels = [muts copy];
}
#pragma mark - event
- (void)tapItemBlock:(void (^)(NSInteger))block{
    self.tapItemBP = block;
}
@end
