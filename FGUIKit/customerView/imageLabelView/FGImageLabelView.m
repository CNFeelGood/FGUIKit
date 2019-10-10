//
//  FGImageLabelView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/9/29.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGImageLabelView.h"

@implementation FGImageLabelView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupFGImageLabelViewConfig];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupFGImageLabelViewConfig];
}
//初始化默认值
- (void)setupFGImageLabelViewConfig{
    self.type = FGImgLabTypeBothMiddle;
    self.topHeight = 8;
    self.imgWidth = 50;
    self.imgHeight = 50;
    self.middleSpaceHeight = 8;
    self.leftSpace = 0;
    self.rightSpace = 0;
}
//重写配置内部逻辑
- (void)setType:(FGImgLabType)type{
    if (_type == type) {
        return;
    }
    if (_imageView || _label) {
        return;
    }
    _type = type;
}
//点语法
- (FGImageLabelView * _Nonnull (^)(FGImgLabType))fgp_type{
    return ^(FGImgLabType type){
        self.type = type;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_topHeight{
    return ^(CGFloat topHeight){
        self.topHeight = topHeight;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_imgWidth{
    return ^(CGFloat imgWidth){
        self.imgWidth = imgWidth;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_imgHeight{
    return ^(CGFloat imgHeight){
        self.imgHeight = imgHeight;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_middleSpaceHeight{
    return ^(CGFloat middleSpaceHeight){
        self.middleSpaceHeight = middleSpaceHeight;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_leftSpace{
    return ^(CGFloat leftSpace){
        self.leftSpace = leftSpace;
        return self;
    }
}
- (FGImageLabelView * _Nonnull (^)(CGFloat))fgp_rightSpace{
    return ^(CGFloat rightSpace){
        self.rightSpace = rightSpace;
        return self;
    }
}
//懒加载布局
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _label = [UILabel new];
        [self setupSubViews];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _imageView = [UIImageView new];
        [self setupSubViews];
    }
    return _label;
}
- (void)setupSubViews{
    [self setupImageViewConstraint];
    [self setupLabelConstraint];
}
- (void)setupImageViewConstraint{
    [self addSubview:_imageView];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray * mutCons = [NSMutableArray new];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:self.topHeight];
    NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:self.imgHeight];
    [mutCons addObjectsFromArray:@[topCon,heightCon]];
    switch (self.type) {
        case FGImgLabTypeBothFill:
        case FGImgLabTypeFillImgMiddleLab:
        {
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:self.leftSpace];
            NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1. constant:self.rightSpace];
            [mutCons addObjectsFromArray:@[leftCon,rightCon]];
        }
            break;
        case FGImgLabTypeBothMiddle:
        {
            NSLayoutConstraint * centerXCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1. constant:0.];
            NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:self.imgWidth];
            [mutCons addObjectsFromArray:@[centerXCon,widthCon]];
        }
            break;
            
        default:
            break;
    }
    [self addConstraints:mutCons];
}
- (void)setupLabelConstraint{
    [self addSubview:_label];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray * mutCons = [NSMutableArray new];
    NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeBottom multiplier:1. constant:self.middleSpaceHeight];
    NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1. constant:0];
    [mutCons addObjectsFromArray:@[topCon,bottomCon]];
    switch (self.type) {
        case FGImgLabTypeBothFill:
        {
            NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
            NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
            [mutCons addObjectsFromArray:@[leftCon,rightCon]];
        }
            break;
        case FGImgLabTypeBothMiddle:
        case FGImgLabTypeFillImgMiddleLab:
        {
            NSLayoutConstraint * centerXCon = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1. constant:0.];
            [mutCons addObject:centerXCon];
        }
            break;
            
        default:
            break;
    }
    [self addConstraints:mutCons];
}


@end
