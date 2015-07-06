//
//  BQNavigationController.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-3.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQNavigationController.h"

@interface BQNavigationController ()

@end

@implementation BQNavigationController

/**
 *  第一次使用这个类的时候调用
 */
+(void)initialize{
    //1.设置导航栏主题
    [self setupNavTheme];
    //2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

+(void)setupBarButtonItemTheme{
    //1.设置背景
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    if (!iOS7) {
    [item setBackgroundImage:[UIImage imagewithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imagewithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imagewithName:@"navigationbar_button_send_background_disabled"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    //2.设置文字样式
    //设置标题
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 16 : 14];
    attributes[UITextAttributeTextColor] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    attributes[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [item setTitleTextAttributes:attributes forState:UIControlStateNormal];
       [item setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
    

}
+(void)setupNavTheme{
    //取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置背景
    if (!iOS7){
        [navBar setBackgroundImage:[UIImage imagewithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    //设置标题
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[UITextAttributeFont] = [UIFont boldSystemFontOfSize:22];
    attributes[UITextAttributeTextColor] = [UIColor blackColor];
    attributes[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [navBar setTitleTextAttributes:attributes];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    if (self.viewControllers.count == 0) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


@end
