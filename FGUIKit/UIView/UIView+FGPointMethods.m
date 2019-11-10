//
//  UIView+FGPointMethods.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UIView+FGPointMethods.h"

@implementation UIView (FGPointMethods)

- (UIView *(^)(CGFloat))fgp_cornerRadius{
    return ^(CGFloat cornerRadius){
        self.layer.masksToBounds = cornerRadius >= 0;
        if (cornerRadius < 0) {
            cornerRadius = 0;
        }
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}
- (UIView *(^)(CGFloat))fgp_borderWidth{
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
- (UIView *(^)(UIColor *))fgp_borderColor{
    return ^(UIColor * borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}
- (UIView *(^)(NSInteger))fgp_tag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}
- (UIView *(^)(CGRect))fgp_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGRect))fgp_bounds{
    return ^(CGRect bounds){
        self.bounds = bounds;
        return self;
    };
}
- (UIView *(^)(CGPoint))fgp_center{
    return ^(CGPoint center){
        self.center = center;
        return self;
    };
}
- (UIView *(^)(UIColor *))fgp_backgroundColor{
    return ^(UIColor * backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}
- (UIView *(^)(CGFloat))fgp_alpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}
- (UIView *(^)(BOOL))fgp_hidden{
    return ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}

@end
