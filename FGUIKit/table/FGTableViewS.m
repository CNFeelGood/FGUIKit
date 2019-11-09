//
//  FGTableView.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/10/18.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGTableViewS.h"
#import "UITableView+FGAdditional.h"

@implementation FGTableViewS

- (FGTableViewS * _Nonnull (^)(UIView * _Nonnull))fgp_nodataView{
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
    if (self = [super initWithFrame:frame]) {
        [self registerCell];
        [self pri_config];
    }
    return self;
}
- (void)registerCell{
    
}
- (void)pri_config{
    [self fg_registerCellClass:UITableViewCell.class];
    self.delegate = self;
    self.dataSource = self;
}
#pragma mark - tab
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = self.datas.count;
    if (count == 0 && self.nodataView) {
        count = 1;
    }
    return count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        return self.frame.size.height;
    }
    return [self fg_tableView:tableView heightForRowAtIndexPath:indexPath];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
        [cell.contentView addSubview:self.nodataView];
        self.nodataView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * leftCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1. constant:0.];
        NSLayoutConstraint * rightCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1. constant:0.];
        NSLayoutConstraint * topCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1. constant:0.];
        NSLayoutConstraint * bottomCon = [NSLayoutConstraint constraintWithItem:self.nodataView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1. constant:0.];
        [cell.contentView addConstraints:@[leftCon,rightCon,topCon,bottomCon]];
        return cell;
    }
    return [self fg_tableView:tableView cellForRowAtIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.datas.count == 0 && self.nodataView) {
        return;
    }
    if (self.didSelectRowAtIndexPathBP)
        self.didSelectRowAtIndexPathBP(indexPath);
}
#pragma mark - 自定义方法
- (CGFloat)fg_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0.;
}
- (UITableViewCell *)fg_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

@end
