//
//  UITableView+FGAdditional.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UITableView+FGAdditional.h"

@implementation UITableView (FGAdditional)

- (void)fg_removeExtraCellLine{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

- (void)fg_registerCellNibWithClass:(Class)aClass{
    NSString * name = NSStringFromClass(aClass);
    [self fg_registerCellNibWithName:name];
}
- (void)fg_registerCellNibWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:name];
}
- (void)fg_registerCellClass:(Class)aClass{
    [self registerClass:aClass forCellReuseIdentifier:NSStringFromClass(aClass)];
}
- (void)fg_registerCellClassWithName:(NSString *)name{
    [self registerClass:NSClassFromString(name) forCellReuseIdentifier:name];
}

- (void)fg_registerHeaderFooterNibWithClass:(Class)aClass{
    NSString * name = NSStringFromClass(aClass);
    [self fg_registerHeaderFooterNibWithName:name];
}
- (void)fg_registerHeaderFooterNibWithName:(NSString *)name{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forHeaderFooterViewReuseIdentifier:name];
}
- (void)fg_registerHeaderFooterClass:(Class)aClass{
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(aClass)];
}
- (void)fg_registerHeaderFooterClassWithName:(NSString *)name{
    [self registerClass:NSClassFromString(name) forHeaderFooterViewReuseIdentifier:name];
}

@end

@implementation UIScrollView (FGAdditional)

- (void)fg_onStatusBarWithViewController:(UIViewController *)controller{
    if (@available(iOS 11.0,*)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        controller.automaticallyAdjustsScrollViewInsets = NO;
    }
}

@end
