//
//  UIViewController+FGPush.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/5.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UIViewController+FGPush.h"

@implementation UIViewController (FGPush)

- (void)fg_pushToVC:(UIViewController *)target{
    UINavigationController * navigation;
    if ([self isKindOfClass:[UINavigationController class]]) {
        navigation = self;
    }else if (self.navigationController){
        navigation = self.navigationController;
    }
    if (navigation) {
        [navigation pushViewController:target animated:YES];        
    }
}

@end
