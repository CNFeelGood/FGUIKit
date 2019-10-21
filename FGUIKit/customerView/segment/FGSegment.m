//
//  FGSegment.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/21.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGSegment.h"

@implementation FGSegment

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupFGSegmentConfig];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupFGSegmentConfig];
}

#pragma mark - 初始化默认值
- (void)setupFGSegmentConfig{
    self.btnArray = [NSMutableArray new];
    self.cutLineArray = [NSMutableArray new];
    
    self.fgp_titleFont([UIFont systemFontOfSize:15])
    .fgp_textDefaultColor([UIColor grayColor])
    .fgp_textSelectedColor([UIColor blackColor])
    .fgp_sliderColor([UIColor blackColor])
    .fgp_sliderPercent(1.)
    .fgp_sliderHeight(2.)
    .fgp_cutLineColor([UIColor grayColor])
    .fgp_cutLineWidth(1)
    .fgp_cutLineHeightPercent(.33)
    .fgp_selectIndex(0)
    .fgp_animateTime(.3);
}
#pragma mark - 点语法
- (FGSegment * _Nonnull (^)(NSArray * _Nonnull))fgp_titles{
    return ^(NSArray * titles){
        self.titles = titles;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(UIFont * _Nonnull))fgp_titleFont{
    return ^(UIFont * titleFont){
        self.titleFont = titleFont;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_textDefaultColor{
    return ^(UIColor * textDefaultColor){
        self.textDefaultColor = textDefaultColor;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_textSelectedColor{
    return ^(UIColor * textSelectedColor){
        self.textSelectedColor = textSelectedColor;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_sliderColor{
    return ^(UIColor * sliderColor){
        self.sliderColor = sliderColor;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(CGFloat))fgp_sliderPercent{
    return ^(CGFloat sliderPercent){
        self.sliderPercent = sliderPercent;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(CGFloat))fgp_sliderHeight{
    return ^(CGFloat sliderHeight){
        self.sliderHeight = sliderHeight;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(UIColor * _Nonnull))fgp_cutLineColor{
    return ^(UIColor * cutLineColor){
        self.cutLineColor = cutLineColor;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(CGFloat))fgp_cutLineWidth{
    return ^(CGFloat cutLineWidth){
        self.cutLineWidth = cutLineWidth;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(CGFloat))fgp_cutLineHeightPercent{
    return ^(CGFloat cutLineHeightPercent){
        self.cutLineHeightPercent = cutLineHeightPercent;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(NSInteger))fgp_selectIndex{
    return ^(NSInteger selectIndex){
        self.selectIndex = selectIndex;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(CGFloat))fgp_animateTime{
    return ^(CGFloat animateTime){
        self.animateTime = animateTime;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(NSArray * _Nonnull))fgp_defaultImages{
    return ^(NSArray * defaultImages){
        self.defaultImages = defaultImages;
        return self;
    };
}
- (FGSegment * _Nonnull (^)(NSArray * _Nonnull))fgp_selectedImages{
    return ^(NSArray * selectedImages){
        self.selectedImages = selectedImages;
        return self;
    };
}
- (void)clickIndexBlock:(void (^)(NSInteger))block{
    self.clickIndexBP = block;
}
- (FGSegment * _Nonnull (^)(void))fgp_setupUI{
    return ^(void){
        [self pri_setupUI];
        return self;
    };
}
#pragma mark - 布局
- (void)pri_setupUI{
    [self clearSubViews];
    [self setupBtn];
    [self setupSliderView];
    [self setupCutLine];
    [self setupSelectItem];
}
- (void)clearSubViews{
    if (self.subviews.count > 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.btnArray removeAllObjects];
        [self.cutLineArray removeAllObjects];
    }
}
- (void)setupBtn{
    NSInteger count;
    if (self.defaultImages.count > 0) {
        count = self.defaultImages.count;
    }else{
        count = self.titles.count;
    }
    for (NSInteger i = 0; i < count; i ++) {
        UIButton * btn = [UIButton new];
        if (self.defaultImages.count > 0) {
            [btn setImage:self.defaultImages[i] forState:UIControlStateNormal];
            [btn setImage:self.selectedImages[i] forState:UIControlStateSelected];
        }else{
            btn.titleLabel.font = self.titleFont;
            [btn setTitle:self.titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:self.textDefaultColor forState:UIControlStateNormal];
            [btn setTitleColor:self.textSelectedColor forState:UIControlStateSelected];
        }//区分是用文字还是图片初始化按钮
        btn.tag = i;
        [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.btnArray addObject:btn];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        if (i == 0) {
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1. constant:0.];
            NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
            NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1./count constant:0.];
            NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1. constant:-self.sliderHeight];
            [self addConstraints:@[leftCon,topCon,widthCon,heightCon]];
        }else{
            UIButton * lastBtn = self.btnArray[i-1];
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lastBtn attribute:NSLayoutAttributeTrailing multiplier:1. constant:0.];
            NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
            NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastBtn attribute:NSLayoutAttributeWidth multiplier:1. constant:0];
            NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:lastBtn attribute:NSLayoutAttributeHeight multiplier:1. constant:0];
            [self addConstraints:@[leftCon,topCon,widthCon,heightCon]];
        }//为btn添加约束
    }//外层大循环
}
- (void)setupSliderView{
    if (self.btnArray.count == 0) {
        return;
    }
    self.sliderView = [UIView new];
    [self addSubview:self.sliderView];
    self.sliderView.translatesAutoresizingMaskIntoConstraints = NO;
    UIButton * button = self.btnArray[self.selectIndex];
    NSLayoutConstraint * sliderLeft = [NSLayoutConstraint constraintWithItem:_sliderView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeLeading multiplier:1. constant:0.];
    NSLayoutConstraint * sliderTop = [NSLayoutConstraint constraintWithItem:_sliderView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
    NSLayoutConstraint * sliderWidth = [NSLayoutConstraint constraintWithItem:_sliderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
    NSLayoutConstraint * sliderHeight = [NSLayoutConstraint constraintWithItem:_sliderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:self.sliderHeight];
    [self addConstraints:@[sliderLeft,sliderTop,sliderWidth,sliderHeight]];
    [self layoutIfNeeded];
    [self removeConstraints:@[sliderLeft,sliderTop,sliderWidth,sliderHeight]];
    
    UIView * colorView = [UIView new];
    [self.sliderView addSubview:colorView];
    colorView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * colorWidth = [NSLayoutConstraint constraintWithItem:colorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_sliderView attribute:NSLayoutAttributeWidth multiplier:self.sliderPercent constant:0.];
    NSLayoutConstraint * colorHeight = [NSLayoutConstraint constraintWithItem:colorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_sliderView attribute:NSLayoutAttributeHeight multiplier:1. constant:0.];
    NSLayoutConstraint * colorVCenter = [NSLayoutConstraint constraintWithItem:colorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_sliderView attribute:NSLayoutAttributeCenterY multiplier:1. constant:0.];
    NSLayoutConstraint * colorHCenter = [NSLayoutConstraint constraintWithItem:colorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_sliderView attribute:NSLayoutAttributeCenterX multiplier:1. constant:0.];
    [self.sliderView addConstraints:@[colorWidth,colorHeight,colorVCenter,colorHCenter]];
    [colorView setBackgroundColor:self.sliderColor];
}
- (void)setupCutLine{
    if (self.btnArray.count == 0) {
        return;
    }
    for (UIButton * btn in self.btnArray) {
        UIView * view = [UIView new];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = self.cutLineColor;
        [self addSubview:view];
        [self.cutLineArray addObject:view];
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
        NSLayoutConstraint * verCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1. constant:0.];
        NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:self.cutLineWidth];
        NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeHeight multiplier:self.cutLineHeightPercent constant:.0];
        [self addConstraints:@[leftCon,verCon,widthCon,heightCon]];
    }
}
- (void)setupSelectItem{
    [self eventValueChanged:self.selectIndex];
}
#pragma mark - event
- (void)clickedBtn:(UIButton *)sender{
    [self eventValueChanged:sender.tag];
}
- (void)eventValueChanged:(NSInteger)index{
    [self btnChangeColorWithIndex:index];
    [self executeDelegateWithIndex:index];
    [self showAnimateWithIndex:index];
}
- (void)btnChangeColorWithIndex:(NSInteger)index{
    UIButton * lastBtn = self.btnArray[self.selectIndex];
    UIButton * currentBtn = self.btnArray[index];
    lastBtn.selected = NO;
    currentBtn.selected = YES;
    self.selectIndex = index;
}
- (void)executeDelegateWithIndex:(NSInteger)index{
    if (self.clickIndexBP) {
        self.clickIndexBP(index);
    }
}
- (void)showAnimateWithIndex:(NSInteger)index{
    [UIView animateWithDuration:self.animateTime animations:^{
        self.sliderView.frame = CGRectMake(self.sliderView.frame.size.width * index,self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
    }];
}
- (void)updateSlider{
    self.sliderView.frame = CGRectMake(self.sliderView.frame.size.width * self.selectIndex, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
}

@end
