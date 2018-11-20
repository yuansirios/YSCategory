//
//  UIImage+YSAddtion.m
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import "UIImage+YSAddtion.h"

@implementation UIImage (YSAddtion)

+ (UIImage *)ys_imageWithSize:(CGSize)size color:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
