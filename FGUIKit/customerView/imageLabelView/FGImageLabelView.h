//
//  FGImageLabelView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/9/29.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FGImgLabType) {
    FGImgLabTypeBothMiddle,  //图片居中，label居中
    FGImgLabTypeFillImgMiddleLab,//图片填满，label居中
    FGImgLabTypeBothFill,//图片填满，label填满
};

@interface FGImageLabelView : UIView

/**
 视图类型，默认为BothMiddle
 */
@property (nonatomic) FGImgLabType type;

/**
 图片距离上端高度，默认8
 */
@property (nonatomic) CGFloat topHeight;

/**
 图片宽度，type为图片居中类型时才会生效,默认50
 */
@property (nonatomic) CGFloat imgWidth;

/**
 图片高度，默认50
 */
@property (nonatomic) CGFloat imgHeight;

/**
 图片和label的间隔，默认8
 */
@property (nonatomic) CGFloat middleSpaceHeight;

/**
 左边间隔，填满模式时生效,默认0
 */
@property (nonatomic) CGFloat leftSpace;

/**
 右边间隔，填满模式时生效，默认0
 */
@property (nonatomic) CGFloat rightSpace;

/**
 图片视图，在调用前确保已设置好上边所有属性
 */
@property (nonatomic,strong) UIImageView * imageView;

/**
 文字视图,在调用前确保已设置好上边所有属性
 */
@property (nonatomic,strong) UILabel * label;

@end

NS_ASSUME_NONNULL_END
