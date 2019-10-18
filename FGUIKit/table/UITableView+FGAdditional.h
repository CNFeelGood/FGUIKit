//
//  UITableView+FGAdditional.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (FGAdditional)

- (void)fg_removeExtraCellLine;

- (void)fg_registerCellNibWithClass:(Class)aClass;
- (void)fg_registerCellNibWithName:(NSString *)name;
- (void)fg_registerCellClass:(Class)aClass;
- (void)fg_registerCellClassWithName:(NSString *)name;

- (void)fg_registerHeaderFooterNibWithClass:(Class)aClass;
- (void)fg_registerHeaderFooterNibWithName:(NSString *)name;
- (void)fg_registerHeaderFooterClass:(Class)aClass;
- (void)fg_registerHeaderFooterClassWithName:(NSString *)name;

@end

@interface UIScrollView (FGAdditional)

- (void)fg_onStatusBarWithViewController:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
