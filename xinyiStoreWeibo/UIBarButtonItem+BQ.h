//
//  UIBarButtonItem+BQ.h
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-7-4.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BQ)
+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highligthedIcon target:(id)target  action:(SEL)action;
@end
