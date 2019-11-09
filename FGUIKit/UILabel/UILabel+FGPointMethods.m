//
//  UILabel+FGPointMethods.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/9.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UILabel+FGPointMethods.h"

@implementation UILabel (FGPointMethods)

- (UILabel *(^)(NSString *))fgp_text{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}
- (UILabel *(^)(UIFont *))fgp_font{
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}
- (UILabel *(^)(UIColor *))fgp_textColor{
    return ^(UIColor * textColor){
        self.textColor = textColor;
        return self;
    };
}
- (UILabel *(^)(UIColor *))fgp_shadowColor{
    return ^(UIColor * shadowColor){
        self.shadowColor = shadowColor;
        return self;
    };
}
- (UILabel *(^)(CGSize))fgp_shadowOffset{
    return ^(CGSize shadowOffset){
        self.shadowOffset = shadowOffset;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment))fgp_textAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}
- (UILabel *(^)(NSLineBreakMode))fgp_lineBreakMode{
    return ^(NSLineBreakMode lineBreakMode){
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}
- (UILabel *(^)(NSAttributedString *))fgp_attributedText{
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}
- (UILabel *(^)(UIColor *))fgp_highlightedTextColor{
    return ^(UIColor * highlightedTextColor){
        self.highlightedTextColor = highlightedTextColor;
        return self;
    };
}
- (UILabel *(^)(BOOL))fgp_highlighted{
    return ^(BOOL highlighted){
        self.highlighted = highlighted;
        return self;
    };
}
- (UILabel *(^)(BOOL))fgp_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}
- (UILabel *(^)(BOOL))fgp_enabled{
    return ^(BOOL enabled){
        self.enabled = enabled;
        return self;
    };
}
- (UILabel *(^)(NSInteger))fgp_numberOfLines{
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}
- (UILabel *(^)(BOOL))fgp_adjustsFontSizeToFitWidth{
    return ^(BOOL adjustsFontSizeToFitWidth){
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}
- (UILabel *(^)(UIBaselineAdjustment))fgp_baselineAdjustment{
    return ^(UIBaselineAdjustment baselineAdjustment){
        self.baselineAdjustment = baselineAdjustment;
        return self;
    };
}
- (UILabel *(^)(CGFloat))fgp_minimumScaleFactor{
    return ^(CGFloat minimumScaleFactor){
        self.minimumScaleFactor = minimumScaleFactor;
        return self;
    };
}
- (UILabel *(^)(BOOL))fgp_allowsDefaultTighteningForTruncation{
    return ^(BOOL allowsDefaultTighteningForTruncation){
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
        return self;
    };
}
- (UILabel *(^)(CGFloat))fgp_preferredMaxLayoutWidth{
    return ^(CGFloat preferredMaxLayoutWidth){
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth;
        return self;
    };
}

@end
