//
//  BQTitleButton.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-5.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQTitleButton.h"

@implementation BQTitleButton

+(instancetype)titleButton{
    return [[self alloc]init];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1设置按钮高亮时，图片不会改变
        self.adjustsImageWhenHighlighted = NO;
        //2.设置文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //3.设置高亮时的背景图片
        [self setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageW = 10;
    CGFloat imageX = contentRect.size.width - 10;
    return CGRectMake(imageX,imageY,imageW,imageH);

}


-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleW = contentRect.size.width - 10;
    CGFloat titleX = 0;
    return CGRectMake(titleX,titleY,titleW,titleH);
}

@end
