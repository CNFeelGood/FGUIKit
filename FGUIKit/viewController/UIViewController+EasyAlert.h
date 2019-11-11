//
//  UIViewController+EasyAlert.h
//  EnterpriseManage
//
//  Created by CQKM on 2017/11/23.
//  Copyright © 2017年 liguojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EasyAlert)

/**
 快速发起一个不做响应的alert

 @param title 标题
 @param message 内容
 */
- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 快速发起一个只有确定按钮，但可以响应的alert

 @param title 标题
 @param message 内容
 @param completion 回调响应
 */
- (void)easyAlertOnlyConfirmActionWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction * action))completion;

/**
 快速发起一个可以响应取消和确定的alert

 @param title 标题
 @param message 内容
 @param completion 回调响应
 */
- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction * action))completion;

/**
 快速发起一个有危险提示的alert

 @param title 标题
 @param message 内容
 @param completion 回调响应
 */
- (void)easyAlertDestructiveWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertAction * action))completion;

/**
 快速发起一个有n个选择的alert

 @param title 标题
 @param message 内容
 @param handlerTexts 选项的标题数组
 @param indexs 需要标记为危险操作的角标
 @param completion 回调响应
 */
- (void)easyAlertWithTitle:(NSString *)title message:(NSString *)message handlerTexts:(NSArray<NSString *>*)handlerTexts destructiveIndexs:(NSArray<NSNumber *>*)indexs completion:(void(^)(NSInteger index))completion;

/**
 快速发起一个sheet

 @param title 标题
 @param stringArray item数组
 @param completion 回调响应 
 */
- (void)easySheetWithTitle:(NSString *)title itemsContentStringArray:(NSArray <NSString *> *)stringArray completion:(void(^)(NSInteger index))completion;

@end
