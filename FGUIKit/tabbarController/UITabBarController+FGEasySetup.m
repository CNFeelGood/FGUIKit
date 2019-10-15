//
//  UITabBarController+FGEasySetup.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/9/27.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UITabBarController+FGEasySetup.h"

@implementation UITabBarController (FGEasySetup)

/**
 *  传入UIViewController或NavigationController均可
 */
- (void)fg_setupWithUIViewControllers:(NSArray *)array{
    NSMutableArray * mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (UIViewController * con in array) {
        if ([con isKindOfClass:[UINavigationController class]]) {
            [mutArray addObject:con];
        }else{
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:con];
            [mutArray addObject:nav];
        }
    }
    self.viewControllers = mutArray;
}
/**
 *  设置标题数组
 */
- (void)fg_setupWithTitles:(NSArray <NSString *> *)titles{
    for (NSInteger i = 0; i < titles.count && i < self.tabBar.items.count; i ++) {
        UITabBarItem * item = self.tabBar.items[i];
        item.title = titles[i];
    }
}
/**
 *  设置默认图片数组
 */
- (void)fg_setupWithNormalImages:(NSArray *)images{
    for (NSInteger i = 0; i < images.count && i < self.tabBar.items.count; i ++) {
        UITabBarItem * item = self.tabBar.items[i];
        if ([images[i] isKindOfClass:[UIImage class]]) {
            item.image = [((UIImage *)images[i]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }else{
            item.image = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}
/**
 *  设置选中图片数组
 */
- (void)fg_setupWithSelectImages:(NSArray *)images{
    for (NSInteger i = 0; i < images.count && i < self.tabBar.items.count; i ++) {
        UITabBarItem * item = self.tabBar.items[i];
        if ([images[i] isKindOfClass:[UIImage class]]) {
            item.selectedImage = [((UIImage *)images[i]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }else{
            item.selectedImage = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}
/**
 *  综合上述
 */
- (void)fg_setupWithUIViewControllers:(NSArray *)array
                               titles:(NSArray <NSString *> *)titles
                     normalImageNames:(NSArray *)normalNames
                     selectImageNames:(NSArray *)selectNames{
    [self fg_setupWithUIViewControllers:array];
    [self fg_setupWithTitles:titles];
    [self fg_setupWithNormalImages:normalNames];
    [self fg_setupWithSelectImages:selectNames];
}

@end
