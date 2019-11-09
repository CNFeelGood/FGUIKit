//
//  UILabel+FGPointMethods.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/9.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FGPointMethods)

- (UILabel *(^)(NSString *))fgp_text;
- (UILabel *(^)(UIFont *))fgp_font;
- (UILabel *(^)(UIColor *))fgp_textColor;
- (UILabel *(^)(UIColor *))fgp_shadowColor;
- (UILabel *(^)(CGSize))fgp_shadowOffset;
- (UILabel *(^)(NSTextAlignment))fgp_textAlignment;
- (UILabel *(^)(NSLineBreakMode))fgp_lineBreakMode;
- (UILabel *(^)(NSAttributedString *))fgp_attributedText;
- (UILabel *(^)(UIColor *))fgp_highlightedTextColor;
- (UILabel *(^)(BOOL))fgp_highlighted;
- (UILabel *(^)(BOOL))fgp_userInteractionEnabled;
- (UILabel *(^)(BOOL))fgp_enabled;
- (UILabel *(^)(NSInteger))fgp_numberOfLines;
- (UILabel *(^)(BOOL))fgp_adjustsFontSizeToFitWidth;
- (UILabel *(^)(UIBaselineAdjustment))fgp_baselineAdjustment;
- (UILabel *(^)(CGFloat))fgp_minimumScaleFactor;
- (UILabel *(^)(BOOL))fgp_allowsDefaultTighteningForTruncation;
- (UILabel *(^)(CGFloat))fgp_preferredMaxLayoutWidth;

@end

NS_ASSUME_NONNULL_END
