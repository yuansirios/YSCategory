//
//  UIView+HUD.h
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUD)

/**
 toast展示
 
 @param title 提示文案
 */
- (void)ys_showToastInMidView:(NSString *)title;

/**
 toast展示
 
 @param title 提示文案
 @param yoffset y轴距离中心偏移距离
 */
- (void)ys_showToast:(NSString *)title yoffset:(CGFloat)yoffset;

/**
 显示指示器
 
 @param title 标题
 */
- (void)ys_showLoadingWithTitle:(NSString *)title;

/**
 显示指示器
 
 @param title 标题
 @param yoffset y轴距离中心偏移距离
 */
- (void)ys_showLoadingWithTitle:(NSString *)title yoffset:(CGFloat)yoffset;

/**
 隐藏指示器
 */
- (void)ys_hidHUD;

@end

NS_ASSUME_NONNULL_END
