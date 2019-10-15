//
//  FGImgCCell.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/15.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGImgCCell.h"

@interface FGImgCCell ()

@property (nonatomic,strong) NSLayoutConstraint * leftCon;
@property (nonatomic,strong) NSLayoutConstraint * rightCon;
@property (nonatomic,strong) NSLayoutConstraint * topCon;
@property (nonatomic,strong) NSLayoutConstraint * bottomCon;

@end

@implementation FGImgCCell

- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [UIImageView new];
        [self addSubview:_imgView];
        _imgView.translatesAutoresizingMaskIntoConstraints = NO;
        self.leftCon = [NSLayoutConstraint constraintWithItem:_imgView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
        self.rightCon = [NSLayoutConstraint constraintWithItem:_imgView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
        self.topCon = [NSLayoutConstraint constraintWithItem:_imgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
        self.bottomCon = [NSLayoutConstraint constraintWithItem:_imgView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
        [self.contentView addConstraints:@[self.leftCon,self.rightCon,self.topCon,self.bottomCon]];
    }
    return _imgView;
}
- (void)setLeftSpace:(CGFloat)leftSpace{
    if (_leftSpace == leftSpace) {
        return;
    }
    _leftSpace = leftSpace;
    if (self.imgView) {
        self.leftCon.constant = _leftSpace;
    }
}
- (void)setRightSpace:(CGFloat)rightSpace{
    if (_rightSpace == rightSpace) {
        return;
    }
    _rightSpace = rightSpace;
    if (self.imgView) {
        self.rightCon.constant = _rightSpace;
    }
}
- (void)setTopSpace:(CGFloat)topSpace{
    if (_topSpace == topSpace) {
        return;
    }
    _topSpace = topSpace;
    if (self.imgView) {
        self.topCon.constant = _topSpace;
    }
}
- (void)setBottomSpace:(CGFloat)bottomSpace{
    if (_bottomSpace == bottomSpace) {
        return;
    }
    _bottomSpace = bottomSpace;
    if (self.imgView) {
        self.bottomCon.constant = _bottomSpace;
    }
}

@end
