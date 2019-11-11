//
//  FGMiddleTabBar.m
//  SLive
//
//  Created by 肥儿古德 on 2019/7/26.
//  Copyright © 2019年 hh. All rights reserved.
//

#import "FGMiddleTabBar.h"

@interface FGMiddleTabBar ()

@property (nonatomic,strong) UIView * backgroundView;
@property (nonatomic,strong) UIImageView * middleImgView;
@property (nonatomic,copy) void(^clickMiddleBP)(void);

@end

@implementation FGMiddleTabBar

- (instancetype)init{
    if (self = [super init]) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
        view.backgroundColor = [UIColor colorWithRed:24/255. green:29/255. blue:41/255. alpha:1.];
        UIImageView * imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1. constant:-10];
        NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1. constant:10];
        NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeTop multiplier:1. constant:57];
        NSLayoutConstraint * heightCon = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0. constant:116./395*[UIScreen mainScreen].bounds.size.width];
        [view addConstraints:@[leftCon,rightCon,bottomCon,heightCon]];
        [self insertSubview:view atIndex:0];
    }
    return self;
}

#pragma mark - set middle btn
- (void)setupMiddleBtnWithImage:(UIImage *)image{
    NSInteger count = self.items.count;
    if (count % 2 == 0) {
        return;
    }
    if (!self.middleImgView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width / count;
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake((count - 1) / 2 * width, 0, width, [FGMiddleConfig sharedInstance].width)];
        [bgView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:bgView];
        self.backgroundView = bgView;
        self.backgroundView.userInteractionEnabled = NO;
        
        self.middleImgView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [FGMiddleConfig sharedInstance].width / 2, 0, [FGMiddleConfig sharedInstance].width, [FGMiddleConfig sharedInstance].height)];
        [self.middleImgView setBackgroundColor:[UIColor whiteColor]];
        [self.middleImgView.layer setCornerRadius:self.middleImgView.bounds.size.width / 2];
        [self.middleImgView.layer setMasksToBounds:YES];
        [self addSubview:self.middleImgView];
        
        [self removeTopBlackLine];
    }
    [self.middleImgView setImage:image];
}
- (void)setupMiddleBtnToTop{
    if (self.middleImgView) {
        [self.middleImgView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [FGMiddleConfig sharedInstance].width / 2, -[FGMiddleConfig sharedInstance].height / 2, [FGMiddleConfig sharedInstance].width, [FGMiddleConfig sharedInstance].height)];
        [self showBorderView];
    }
}
- (void)setupMiddleBtnToCenter{
    if (self.middleImgView) {
        [self.middleImgView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [FGMiddleConfig sharedInstance].width / 2, 0, [FGMiddleConfig sharedInstance].width, [FGMiddleConfig sharedInstance].height)];
    }
}
- (void)setupMiddleBtnOutPercent:(CGFloat)percent{
    if (self.middleImgView) {
        [self.middleImgView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [FGMiddleConfig sharedInstance].width / 2, -[FGMiddleConfig sharedInstance].height * percent, [FGMiddleConfig sharedInstance].width, [FGMiddleConfig sharedInstance].height)];
        [self showBorderView];
    }
}
- (void)showBorderView{
//    _borderView.hidden = NO;
//    [_borderView setFrame:CGRectMake(self.middleImgView.frame.origin.x - 1, self.middleImgView.frame.origin.y - 1, self.middleImgView.frame.size.width + 2, self.middleImgView.frame.size.height + 2)];
//    _borderView.layer.cornerRadius = _borderView.frame.size.height / 2;
}
- (void)clickMiddleBtn:(void (^)(void))click{
    self.clickMiddleBP = click;
    self.backgroundView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMiddleImage:)];
    [self.middleImgView addGestureRecognizer:tap];
}
- (void)clickMiddleImage:(id)sender{
    if (self.clickMiddleBP) {
        self.clickMiddleBP();
    }
}
#pragma mark - black line
/**
 *  移除黑线
 */
- (void)removeTopBlackLine{
//    UIImage * image = [UIImage imageWithColor:[UIColor whiteColor]];
//    [self setShadowImage:image];
//    [self setBackgroundImage:image];
//    self.barStyle = UIBarStyleBlack;
}

@end

@implementation FGMiddleConfig

+ (instancetype)sharedInstance{
    static FGMiddleConfig * config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [FGMiddleConfig new];
        config.width = 47;
        config.height = 47;
    });
    return config;
}

@end
