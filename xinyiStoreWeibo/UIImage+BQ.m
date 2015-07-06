//
//  UIImage+BQ.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-30.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "UIImage+BQ.h"

@implementation UIImage (BQ)
+(UIImage *)imagewithName:(NSString *)name{
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {//如果图片没有ios7的图片，就使用原图
            return [UIImage imageNamed:name];
        }
        return image;
    }
    
    //非ios7
    return [UIImage imageNamed:name];
}

+(UIImage *)resizeImageWithName:(NSString *)name{
    UIImage *image = [UIImage imagewithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height *0.5];
}
@end
