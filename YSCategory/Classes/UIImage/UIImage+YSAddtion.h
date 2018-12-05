//
//  UIImage+YSAddtion.h
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YSAddtion)

/**
 获取纯色图片

 @param color 颜色
 @return 图像
 */
+ (UIImage *)ys_imageWithColor:(UIColor *)color;

/**
 图片设置圆角

 @return 图像
 */
- (UIImage *)ys_circleImage;


/**
 通过图片Data数据第一个字节 来获取图片扩展名

 @param data 数据
 @return 类型
 */
- (NSString *)ys_contentTypeForImageData:(NSData *)data;


/**
 获取图片某一点的颜色

 @param point 位置
 @return 颜色
 */
- (UIColor *)colorAtPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
