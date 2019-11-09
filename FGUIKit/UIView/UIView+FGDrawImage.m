//
//  UIView+FGDrawImage.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/9.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UIView+FGDrawImage.h"

@implementation UIView (FGDrawImage)

- (UIImage *)fg_drawImage{
    CGSize s = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
