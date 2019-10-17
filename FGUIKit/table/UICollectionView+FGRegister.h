//
//  UICollectionView+FGRegister.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/17.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (FGRegister)

- (void)fg_registerCellNibWithClass:(Class)aClass;
- (void)fg_registerCellNibWithName:(NSString *)name;
- (void)fg_registerCellClass:(Class)aClass;
- (void)fg_registerCellClassWithName:(NSString *)name;

- (void)fg_registerHeaderNibWithClass:(Class)aClass;
- (void)fg_registerHeaderNibWithName:(NSString *)name;
- (void)fg_registerHeaderClass:(Class)aClass;
- (void)fg_registerHeaderClassWithName:(NSString *)name;

- (void)fg_registerFooterNibWithClass:(Class)aClass;
- (void)fg_registerFooterNibWithName:(NSString *)name;
- (void)fg_registerFooterClass:(Class)aClass;
- (void)fg_registerFooterClassWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
