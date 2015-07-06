//
//  BQSearchBar.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-5.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQSearchBar.h"

@implementation BQSearchBar

+(instancetype)searchBar{
    return [[self alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackground:[UIImage resizeImageWithName:@"searchbar_textfield_background"]];
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imagewithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftView.bounds = CGRectMake(0, 0, 30, 25);
        self.leftViewMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:13];
        self.clearButtonMode = UITextFieldViewModeAlways;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:attributes];
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
