//
//  UIView+FGGradient.m
//  CoolPower
//
//  Created by 肥儿古德 on 2019/4/19.
//  Copyright © 2019年 hh. All rights reserved.
//

#import "UIView+FGGradient.h"

@implementation UIView (FGGradient)

- (void)fillGradientWithFrame:(CGRect)frame colors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    //  创建渐变色数组，需要转换为CGColor颜色
    NSMutableArray * muts = [NSMutableArray new];
    for (UIColor * color in colors) {
        [muts addObject:(id)[color CGColor]];
    }
    gradientLayer.colors = [muts copy];
    
    //  设置三种颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = locations;
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    
    //  添加渐变色到创建的 UIView 上去
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)fillGradientWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    [self fillGradientWithFrame:self.frame colors:colors locations:locations startPoint:startPoint endPoint:endPoint];
}

- (void)fillGradientHorizontalWithColors:(NSArray<UIColor *> *)colors{
    NSMutableArray * mutLocations = [NSMutableArray new];
    [mutLocations addObject:@(0)];
    for (NSInteger i = 1; i < colors.count - 1; i ++) {
        CGFloat floatNum = 1. / (colors.count - 1);
        NSNumber * number = [NSNumber numberWithFloat:floatNum];
        [mutLocations addObject:number];
    }
    [mutLocations addObject:@(1)];
    [self fillGradientWithColors:colors locations:mutLocations startPoint:CGPointMake(0, .5) endPoint:CGPointMake(1, .5)];
}

- (void)fillGradientVerticalWithColors:(NSArray<UIColor *> *)colors{
    NSMutableArray * mutLocations = [NSMutableArray new];
    [mutLocations addObject:@(0)];
    for (NSInteger i = 1; i < colors.count - 1; i ++) {
        CGFloat floatNum = 1. / (colors.count - 1);
        NSNumber * number = [NSNumber numberWithFloat:floatNum];
        [mutLocations addObject:number];
    }
    [mutLocations addObject:@(1)];
    [self fillGradientWithColors:colors locations:mutLocations startPoint:CGPointMake(.5, 0) endPoint:CGPointMake(.5, 1)];
}

@end
