//
//  FGImgLabViews.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGImgLabViews.h"
#import "FGImageLabelView.h"
//#import "UIView+FGEvent.h"

@interface FGImgLabViews ()

@property (nonatomic,strong) NSMutableArray * imgLabViews;
@property (nonatomic,copy) void(^tapItemBP)(NSInteger index);
@property (nonatomic) dispatch_once_t onceToken;

@end

@implementation FGImgLabViews

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupFGImgLabViewsConfig];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupFGImgLabViewsConfig];
}

#pragma mark - 初始化默认值
- (void)setupFGImgLabViewsConfig{
    self.topHeight = 8;
    self.imgWidth = 50;
    self.imgHeight = 50;
    self.middleHeight = 8;
    self.font = [UIFont systemFontOfSize:15];
    self.color = [UIColor blackColor];
}
#pragma mark - 重写内部逻辑
- (void)setVerticalCount:(NSUInteger)verticalCount{
    if (self.imgLabViews.count > 0) {
        return;
    }
    _verticalCount = verticalCount;
    [self setupSubViews];
}
- (void)setHorizontalCount:(NSUInteger)horizontalCount{
    if (self.imgLabViews.count > 0) {
        return;
    }
    _horizontalCount = horizontalCount;
    [self setupSubViews];
}
- (void)setFont:(UIFont *)font{
    _font = font;
    for (NSInteger i = 0; i < self.imgLabViews.count; i ++) {
        FGImageLabelView * imgLabView = [self.imgLabViews objectAtIndex:i];
        [imgLabView.label setFont:_font];
    }
}
- (void)setColor:(UIColor *)color{
    _color = color;
    for (NSInteger i = 0; i < self.imgLabViews.count; i ++) {
        FGImageLabelView * imgLabView = [self.imgLabViews objectAtIndex:i];
        [imgLabView.label setTextColor:_color];
    }
}
- (void)setImages:(NSArray *)images{
    _images = images;
    for (NSInteger i = 0; i < _images.count && i < self.imgLabViews.count; i ++) {
        FGImageLabelView * imgLabView = [self.imgLabViews objectAtIndex:i];
        UIImage * image = [_images objectAtIndex:i];
        imgLabView.imageView.image = image;
    }
}
- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    for (NSInteger i = 0; i < _titles.count && i < self.imgLabViews.count; i ++) {
        FGImageLabelView * imgLabView = [self.imgLabViews objectAtIndex:i];
        NSString * title = [_titles objectAtIndex:i];
        imgLabView.label.text = title;
    }
}
#pragma mark - 点语法
- (FGImgLabViews * _Nonnull (^)(NSUInteger))fgp_verticalCount{
    return ^(NSUInteger verticalCount){
        self.verticalCount = verticalCount;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(NSUInteger))fgp_horizontalCount{
    return ^(NSUInteger horizontalCount){
        self.horizontalCount = horizontalCount;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(CGFloat))fgp_topHeight{
    return ^(CGFloat topHeight){
        self.topHeight = topHeight;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(CGFloat))fgp_imgWidth{
    return ^(CGFloat imgWidth){
        self.imgWidth = imgWidth;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(CGFloat))fgp_imgHeight{
    return ^(CGFloat imgHeight){
        self.imgHeight = imgHeight;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(CGFloat))fgp_middleHeight{
    return ^(CGFloat middleHeight){
        self.middleHeight = middleHeight;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(UIFont *))fgp_font{
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(UIColor *))fgp_color{
    return ^(UIColor * color){
        self.color = color;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(NSArray * _Nonnull))fgp_images{
    return ^(NSArray * images){
        self.images = images;
        return self;
    };
}
- (FGImgLabViews * _Nonnull (^)(NSArray * _Nonnull))fgp_titles{
    return ^(NSArray * titles){
        self.titles = titles;
        return self;
    };
}
#pragma mark - block
- (void)tapItemBlock:(void (^)(NSInteger))block{
    self.tapItemBP = block;
}

#pragma mark - 懒加载布局
- (void)tapGesture:(UITapGestureRecognizer *)tap{
    if (self.tapItemBP) {
        self.tapItemBP(tap.view.tag);
    }
}
- (void)setupSubViews{
    if (_verticalCount * _horizontalCount == 0) {
        return;
    }
    if (self.imgLabViews.count > 0) {
        return;
    }
    //TODO:布局
    self.imgLabViews = [NSMutableArray new];
    for (NSInteger i = 0; i < _verticalCount; i ++) {
        for (NSInteger j = 0; j < _horizontalCount; j ++) {
            FGImageLabelView * view = [FGImageLabelView new];
            view.tag = i * _horizontalCount + j;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
            [view setUserInteractionEnabled:YES];
            [view addGestureRecognizer:tap];
            [self.imgLabViews addObject:view];
            [self addSubview:view];
            view.translatesAutoresizingMaskIntoConstraints = NO;
            NSMutableArray * mutCons = [NSMutableArray new];
            if (i == 0 && j == 0) {
                NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
                NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
                NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1./_horizontalCount constant:0.];
                NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1./_verticalCount constant:0.];
                [mutCons addObjectsFromArray:@[leftCon,topCon,widthCon,heightCon]];
            }else if (j == 0){
                UIView * topView = self.imgLabViews[(i - 1) * _horizontalCount];
                NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
                NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
                NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
                NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
                [mutCons addObjectsFromArray:@[leftCon,topCon,widthCon,heightCon]];
            }else{
                UIView * lastView = self.imgLabViews[self.imgLabViews.count - 2];
                NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
                NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
                NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
                NSLayoutConstraint * widthCon = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeWidth multiplier:1. constant:0.];
                [mutCons addObjectsFromArray:@[leftCon,topCon,bottomCon,widthCon]];
            }//if end
            [self addConstraints:mutCons];
        }// for j end
    }// for i end
    //布局完成，若存在图片和标题，进行配置
    self.fgp_images(self.images).fgp_titles(self.titles);
}

@end
