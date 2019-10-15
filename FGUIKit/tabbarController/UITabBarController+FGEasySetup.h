//
//  UITabBarController+FGEasySetup.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/9/27.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (FGEasySetup)

/**
 *  传入UIViewController或NavigationController均可
 */
- (void)fg_setupWithUIViewControllers:(NSArray *)array;
/**
 *  设置标题数组
 */
- (void)fg_setupWithTitles:(NSArray <NSString *> *)titles;
/**
 *  设置默认图片数组(传入图片或图片名称均可)
 */
- (void)fg_setupWithNormalImages:(NSArray *)images;
/**
 *  设置选中图片数组(传入图片或图片名称均可)
 */
- (void)fg_setupWithSelectImages:(NSArray *)images;
/**
 *  综合上述
 */
- (void)fg_setupWithUIViewControllers:(NSArray *)array
                               titles:(NSArray <NSString *> *)titles
                     normalImageNames:(NSArray *)normalNames
                     selectImageNames:(NSArray *)selectNames;

@end

NS_ASSUME_NONNULL_END
