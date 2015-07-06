//
//  UIBarButtonItem+BQ.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-4.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "UIBarButtonItem+BQ.h"

@implementation UIBarButtonItem (BQ)
+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highligthedIcon target:(id)target action:(SEL)action{
    UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setBackgroundImage:[UIImage imagewithName:icon] forState:UIControlStateNormal];
    [Button setBackgroundImage:[UIImage imagewithName:highligthedIcon] forState:UIControlStateHighlighted];
    Button.bounds = CGRectMake(0, 0,Button.currentBackgroundImage.size.width,Button.currentBackgroundImage.size.height);
    [Button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:Button];
}
@end
