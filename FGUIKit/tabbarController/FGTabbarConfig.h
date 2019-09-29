//
//  FGTabbarConfig.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/9/28.
//  Copyright © 2019 hh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGTabbarConfig : NSObject

+ (NSArray *)viewControllers;
+ (NSArray *)titles;
+ (NSArray *)normalImages;
+ (NSArray *)selectImages;

@end

NS_ASSUME_NONNULL_END
