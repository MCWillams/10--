//
//  BQBadgeButton.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-3.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQBadgeButton.h"

@implementation BQBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.userInteractionEnabled = NO;
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = [badgeValue copy];
    if (badgeValue) {//badgeValue有值显示提醒按钮
        self.hidden = NO;
        [self setTitle:badgeValue forState:UIControlStateNormal];
    }
    else{
        self.hidden = YES;
    }
    CGFloat badgeButtonX = 34;
    CGFloat badgeButtonY = -2;
    CGSize size = [badgeValue sizeWithFont:self.titleLabel.font];
    CGFloat badgeButtonW = size.width + 10;
    CGFloat badgeButtonH = self.currentBackgroundImage.size.height;
    self.frame = CGRectMake(badgeButtonX , badgeButtonY , badgeButtonW, badgeButtonH);
}

@end
