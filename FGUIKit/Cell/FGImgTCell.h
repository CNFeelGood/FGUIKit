//
//  FGImgTCell.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/15.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGImgTCell : UITableViewCell

@property (nonatomic,strong) UIImageView * imgView;
@property (nonatomic) CGFloat leftSpace;
@property (nonatomic) CGFloat rightSpace;
@property (nonatomic) CGFloat topSpace;
@property (nonatomic) CGFloat bottomSpace;

@end

NS_ASSUME_NONNULL_END
