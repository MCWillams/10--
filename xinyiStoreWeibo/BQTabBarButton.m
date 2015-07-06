//
//  BQTabBarButton.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-30.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQTabBarButton.h"
#import "BQBadgeButton.h"
@interface BQTabBarButton()
@property (nonatomic,weak) BQBadgeButton *badgeButton;
@end
@implementation BQTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) {
            [self setBackgroundImage:[UIImage imagewithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
       
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self setTitleColor:iOS7 ? [UIColor blackColor] : [UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        //添加数字提醒按钮
        BQBadgeButton *badgeButton = [[BQBadgeButton alloc]init];
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}
//销毁观察者
-(void)dealloc{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
}
-(void)setHighlighted:(BOOL)highlighted{

}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, self.frame.size.width , self.frame.size.height * 0.6);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, self.frame.size.height * 0.6, self.frame.size.width, self.frame.size.height * 0.4);
}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    //1.设置按钮的图像
    [self setImage:item.image forState:UIControlStateNormal];
    //设置按钮选中图像
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    //2.设置按钮标题
    [self setTitle:item.title forState:UIControlStateNormal];
    //3.设置badgeButton
    self.badgeButton.badgeValue = item.badgeValue;
    //4.设置监听
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
}
/**
 *  KVO
 *
 *  @param keyPath 监听对象的某个属性
 *  @param object  监听对象
*  @param change 属性的改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //1.取出item
    UITabBarItem *item = object;
    //2.重新设置badgeButton
    self.badgeButton.badgeValue = item.badgeValue;
}
@end









