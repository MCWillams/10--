//
//  BQTabBarController.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-28.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQTabBarController.h"
#import "BQHomeViewController.h"
#import "BQMessageViewController.h"
#import "BQDiscoverViewController.h"
#import "BQMeViewController.h"
#import "BQTabBar.h"
#import "BQNavigationController.h"
@interface BQTabBarController ()<BQTabBarDelegate>
@property(nonatomic,weak)BQTabBar *customTabBar;
@end

@implementation BQTabBarController

/**
 *  BQTabBarDelegate
 */
-(void)tabBar:(BQTabBar *)tabBar didSelectButton:(UIButton *)button from:(int)from to:(int)to{
    self.selectedIndex = to;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCustomTabBar];
    [self setupAllChildControllers];
//    [self setCustomTabBar];

}
/**
 *  设置自定义tabbar
 */
-(void)setCustomTabBar{
    BQTabBar *customTabBar = [[BQTabBar alloc]init];
//    customTabBar.backgroundColor = [UIColor redColor];
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    self.customTabBar.delegate = self;
}

/**
 *  初始化所有子控制器
 */
-(void)setupAllChildControllers{
    BQHomeViewController *home = [[BQHomeViewController alloc]init];
    home.tabBarItem.badgeValue = @"999+";
    [self setupTabBarControllerWithContrller:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    BQMessageViewController *message = [[BQMessageViewController alloc]init];
    message.tabBarItem.badgeValue = @"new";
    [self setupTabBarControllerWithContrller:message title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    
    BQDiscoverViewController *discover = [[BQDiscoverViewController alloc]init];
    discover.tabBarItem.badgeValue = @"1";
    [self setupTabBarControllerWithContrller:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    BQMeViewController *me = [[BQMeViewController alloc]init];
    me.tabBarItem.badgeValue = @"❤️";
    [self setupTabBarControllerWithContrller:me title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}
/**
 *  设置子控制器
 *
 *  @param controller    子控制器
 *  @param title         子控制器标题
 *  @param image         对应tabbar图像
 *  @param selectedImage 选中对应tabbar图像
 */
-(void)setupTabBarControllerWithContrller: (UIViewController *)controller title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    controller.title = title;
    controller.tabBarItem.image = [UIImage imagewithName:image];
    if (iOS7) {
        controller.tabBarItem.selectedImage = [[UIImage imagewithName:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    controller.tabBarItem.selectedImage = [UIImage imagewithName:selectedImage];
    
    //包装一个导航控制器
    BQNavigationController *nav = [[BQNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButton:controller.tabBarItem];
}

@end










