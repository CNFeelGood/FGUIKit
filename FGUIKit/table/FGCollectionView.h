//
//  FGCollectionView.h
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/17.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,FGCollectionScrollType) {
    FGCollectionScrollTypeVertical,
    FGCollectionScrollTypeHorizontal,
};

@interface FGCollectionView : UICollectionView <UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) FGCollectionScrollType scrollType;
- (FGCollectionView *(^)(FGCollectionScrollType))fgp_scrollType;

#pragma mark - 属性，只读
@property (nonatomic,copy,readonly) NSArray * datas;
@property (nonatomic,copy,readonly) void(^refreshDataBP)(void);
@property (nonatomic,copy,readonly) void(^loadMoreDataBP)(void);
@property (nonatomic,copy,readonly) void(^didSelectRowAtIndexPathBP)(NSIndexPath * indexPath);

@property (nonatomic,strong) UIView * nodataView;
- (FGCollectionView *(^)(UIView *))fgp_nodataView;

#pragma mark - 和外界交互的方法
//外部传向内部
- (void)reloadWithDatas:(NSArray *)datas;
//内部传向外部
- (void)eventBlockWithRefresh:(void(^)(void))refresh loadMore:(void(^)(void))loadMore didSelectRowAtIndexPath:(void(^)(NSIndexPath * indexPath))select;

#pragma mark - 子类复写的方法（基本属于必须复写的方法）
/**
 注册cell
 */
- (void)registerCell;

/**
 获得size,本类封装有对没有数据情况的处理，子类需要实现带fg的方法.若不需要展示无数据视图，则可以直接实现不带fg的原本代理方法
 */
- (CGSize)fg_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 获得cell，本类封装有对没有数据情况的处理，子类需要实现带fg的方法.若不需要展示无数据视图，则可以直接实现不带fg的原本代理方法
 */
- (UICollectionViewCell *)fg_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
