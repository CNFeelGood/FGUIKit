//
//  UIViewController+EasyAlert.m
//  EnterpriseManage
//
//  Created by CQKM on 2017/11/23.
//  Copyright © 2017年 liguojun. All rights reserved.
//

#import "UIViewController+EasyAlert.h"

@implementation UIViewController (EasyAlert)


- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0,0,0,0);
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)easyAlertOnlyConfirmActionWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction * action))completion{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:completion]];
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0,0,0,0);
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction *))completion {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:completion]];
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0,0,0,0);
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)easyAlertDestructiveWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction * action))completion{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:completion]];
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0,0,0,0);
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message handlerTexts:(NSArray<NSString *>*)handlerTexts destructiveIndexs:(NSArray<NSNumber *>*)indexs completion:(void(^)(NSInteger index))completion{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSInteger i = 0; i < handlerTexts.count; i ++) {
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        for (NSNumber * number in indexs) {
            if (number.integerValue == i) {
                style = UIAlertActionStyleDestructive;
                break;
            }
        }
        [alert addAction:[UIAlertAction actionWithTitle:handlerTexts[i] style:style handler:^(UIAlertAction * _Nonnull action) {
            completion(i);
        }]];
    }
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0, 0, 0, 0);
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)easySheetWithTitle:(NSString *)title itemsContentStringArray:(NSArray <NSString *> *)stringArray completion:(void(^)(NSInteger index))completion{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger i = 0; i < stringArray.count; i ++) {
        [alert addAction:[UIAlertAction actionWithTitle:stringArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completion(i);
        }]];
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(0,0,0,0);
    [self presentViewController:alert animated:YES completion:nil];
}

@end
