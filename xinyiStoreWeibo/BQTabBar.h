//
//  BQTabBar.h
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-29.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BQTabBar;
@protocol BQTabBarDelegate <NSObject>
@optional
-(void)tabBar:(BQTabBar *)tabBar didSelectButton:(UIButton *)button from:(int)from to:(int)to;
@end
@interface BQTabBar : UIView
-(void)addTabBarButton:(UITabBarItem *)item;
@property (nonatomic,weak) id delegate;
@end
