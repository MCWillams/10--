//
//  BQTabBar.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-29.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQTabBar.h"
#import "BQTabBarButton.h"
@interface BQTabBar()
@property (nonatomic,weak) BQTabBarButton *selectedButton;
@property (nonatomic,weak) UIButton *addButton;
@property (nonatomic,strong) NSMutableArray *tabBarButtons;
@end
@implementation BQTabBar


/**
 *  懒加载 存放tabbar的button
 */
-(NSMutableArray *)tabBarButtons{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}



-(void)addTabBarButton:(UITabBarItem *)item{
    //创建button
    BQTabBarButton *button = [[BQTabBarButton alloc]init];
    [self addSubview:button];
    //传递item
    button.item = item;
    //监听button点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //添加到数组中
    [self.tabBarButtons addObject:button];
}
/**
 *  按钮点击事件
 */
-(void)buttonClick:(BQTabBarButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButton:from:to:)]) {
        [self.delegate tabBar:self didSelectButton:button from:self.selectedButton.tag to:button.tag];
    }
    //选中按钮取消选中
    self.selectedButton.selected = NO;
    //当前按钮选中
    button.selected = YES;
    //储存当前按钮
    self.selectedButton = button;
}

-(void)layoutSubviews{
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    self.addButton.center = CGPointMake(W * 0.5, H * 0.5);
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        CGFloat buttonY = 0;
        CGFloat buttonW = W / self.subviews.count;
        CGFloat buttonH = H;
        CGFloat buttonX = index * buttonW;
        if (index > 1) {
            buttonX += buttonW;
        }
        BQTabBarButton *button = self.tabBarButtons[index];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
        if (index == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (!iOS7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];

        }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imagewithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imagewithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imagewithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setImage:[UIImage imagewithName:@"tabbar_compose_icon_add_highleighted"] forState:UIControlStateHighlighted];
        button.bounds = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
        [self addSubview:button];
        self.addButton = button;
    }
    return self;
}

@end


















