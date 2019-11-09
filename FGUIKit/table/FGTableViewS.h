//
//  FGTableView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 请不要直接调用此类，用子类实现方法后，调用子类
 */
@interface FGTableViewS : UITableView <UITableViewDelegate,UITableViewDataSource>

#pragma mark - 属性，只读
@property (nonatomic,copy,readonly) NSArray * datas;
@property (nonatomic,copy,readonly) void(^refreshDataBP)(void);
@property (nonatomic,copy,readonly) void(^loadMoreDataBP)(void);
@property (nonatomic,copy,readonly) void(^didSelectRowAtIndexPathBP)(NSIndexPath * indexPath);

@property (nonatomic,strong) UIView * nodataView;
- (FGTableView *(^)(UIView *))fgp_nodataView;

#pragma mark - 和外界交互的方法
//外部传向内部
- (void)reloadWithDatas:(NSArray *)datas;
//内部传向外部,需要将实现复制到子类并解开注释
- (void)eventBlockWithRefresh:(void(^)(void))refresh loadMore:(void(^)(void))loadMore didSelectRowAtIndexPath:(void(^)(NSIndexPath * indexPath))select;

#pragma mark - 子类复写的方法（基本属于必须复写的方法）
/**
 注册cell
 */
- (void)registerCell;

/**
 获得高度,本类封装有对没有数据情况的处理，子类需要实现带fg的方法.若不需要展示无数据视图，则可以直接实现不带fg的原本代理方法
 */
- (CGFloat)fg_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 获得cell,本类封装有对没有数据情况的处理，子类需要实现带fg的方法.若不需要展示无数据视图，则可以直接实现不带fg的原本代理方法
 */
- (UITableViewCell *)fg_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
