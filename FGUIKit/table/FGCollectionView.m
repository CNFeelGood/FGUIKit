//
//  FGCollectionView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/17.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGCollectionView.h"
#import "UICollectionView+FGRegister.h"

@implementation FGCollectionView

- (void)setScrollType:(FGCollectionScrollType)scrollType{
    if (_scrollType == scrollType) {
        return;
    }
    _scrollType = scrollType;
    switch (_scrollType) {
        case FGCollectionScrollTypeHorizontal:
        {
            [(UICollectionViewFlowLayout *)(self.collectionViewLayout) setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        }
            break;
        case FGCollectionScrollTypeVertical:
        {
            [(UICollectionViewFlowLayout *)(self.collectionViewLayout) setScrollDirection:UICollectionViewScrollDirectionVertical];
        }
            break;
            
        default:
            break;
    }
}
- (FGCollectionView * _Nonnull (^)(FGCollectionScrollType))fgp_scrollType{
    return ^(FGCollectionScrollType scrollType){
        self.scrollType = scrollType;
        return self;
    };
}
- (FGCollectionView * _Nonnull (^)(UIView *))fgp_nodataView{
    return ^(UIView * nodataView){
        self.nodataView = nodataView;
        return self;
    };
}
- (void)reloadWithDatas:(NSArray *)datas{
    _datas = datas;
    [self reloadData];
}
- (void)eventBlockWithRefresh:(void (^)(void))refresh loadMore:(void (^)(void))loadMore didSelectRowAtIndexPath:(void (^)(NSIndexPath * _Nonnull))select{
    //此处需要依赖 MJRefresh ，在子类引入后重写此方法，并将注释解开。也可以根据需要自定义
//    _refreshDataBP = refresh;
//    if (_refreshDataBP) {
//        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            if (self.refreshDataBP) self.refreshDataBP();
//        }];
//    }
//    _loadMoreDataBP = loadMore;
//    if (_loadMoreDataBP) {
//        self.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
//            if (self.loadMoreDataBP) self.loadMoreDataBP();
//        }];
//    }
//    _didSelectRowAtIndexPathBP = select;
}
#pragma mark - setup
- (void)awakeFromNib{
    [super awakeFromNib];
    [self registerCell];
    [self pri_config];
}
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection  = UICollectionViewScrollDirectionVertical;
    self = [[[self class] alloc] initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerCell];
        [self pri_config];
    }
    return self;
}
- (void)registerCell{
    [self fg_registerCellClass:[UICollectionViewCell class]];
}
- (void)pri_config{
    self.delegate = self;
    self.dataSource = self;
}
#pragma mark - collection
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = self.datas.count;
    if (count == 0 && self.nodataView) {
        count = 1;
    }
    return count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        return self.frame.size;
    }
    return [self fg_collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
        [cell addSubview:self.nodataView];
        self.nodataView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
        NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
        NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
        NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
        [cell addConstraints:@[leftCon,rightCon,topCon,bottomCon]];
        return cell;
    }
    return [self fg_collectionView:collectionView cellForItemAtIndexPath:indexPath];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        return;
    }
    if (self.didSelectRowAtIndexPathBP) self.didSelectRowAtIndexPathBP(indexPath);
}


@end
