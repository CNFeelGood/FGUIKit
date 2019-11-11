//
//  FGMiddleTabBarController.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGMiddleTabBarController.h"
#import "FGMiddleTabBar.h"

@interface FGMiddleTabBarController ()

@end

@implementation FGMiddleTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setValue:[FGMiddleTabBar new] forKey:@"tabBar"];
}
#pragma mark - set middle btn
- (void)setupMiddleBtnWithImage:(UIImage *)image{
    FGMiddleTabBar * tabBar = (FGMiddleTabBar *)self.tabBar;
    [tabBar setupMiddleBtnWithImage:image];
}
- (void)setupMiddleBtnToTop{
    FGMiddleTabBar * tabBar = (FGMiddleTabBar *)self.tabBar;
    [tabBar setupMiddleBtnToTop];
}
- (void)setupMiddleBtnToCenter{
    FGMiddleTabBar * tabBar = (FGMiddleTabBar *)self.tabBar;
    [tabBar setupMiddleBtnToCenter];
}
- (void)setupMiddleBtnOutPercent:(CGFloat)percent{
    FGMiddleTabBar * tabBar = (FGMiddleTabBar *)self.tabBar;
    [tabBar setupMiddleBtnOutPercent:percent];
}
- (void)clickMiddleBtn:(void (^)(void))click{
    FGMiddleTabBar * tabBar = (FGMiddleTabBar *)self.tabBar;
    [tabBar clickMiddleBtn:click];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
