//
//  UICollectionView+FGRegister.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/17.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UICollectionView+FGRegister.h"

@implementation UICollectionView (FGRegister)

- (void)fg_registerCellNibWithClass:(Class)aClass{
    NSString * name = NSStringFromClass(aClass);
    [self fg_registerCellNibWithName:name];
}
- (void)fg_registerCellNibWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellWithReuseIdentifier:name];
}
- (void)fg_registerCellClass:(Class)aClass{
    [self registerClass:aClass forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}
- (void)fg_registerCellClassWithName:(NSString *)name{
    [self registerClass:NSClassFromString(name) forCellWithReuseIdentifier:name];
}

- (void)fg_registerHeaderNibWithClass:(Class)aClass{
    NSString * name = NSStringFromClass(aClass);
    [self fg_registerHeaderNibWithName:name];
}
- (void)fg_registerHeaderNibWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:name];
}
- (void)fg_registerHeaderClass:(Class)aClass{
    [self registerClass:aClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(aClass)];
}
- (void)fg_registerHeaderClassWithName:(NSString *)name{
    [self registerClass:NSClassFromString(name) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:name];
}

- (void)fg_registerFooterNibWithClass:(Class)aClass{
    NSString * name = NSStringFromClass(aClass);
    [self fg_registerFooterNibWithName:name];
}
- (void)fg_registerFooterNibWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:name];
}
- (void)fg_registerFooterClass:(Class)aClass{
    [self registerClass:aClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(aClass)];
}
- (void)fg_registerFooterClassWithName:(NSString *)name{
    [self registerClass:NSClassFromString(name) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:name];
}

@end
