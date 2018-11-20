//
//  UIButton+YSAddtion.h
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YSAddtion)

#pragma mark - *********** TitleLabel Alignment ***********

- (void)ys_titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                       verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                       contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets;

#pragma mark - *********** Title Color ***********

- (void)ys_setNormalTitleColor:(UIColor *)color;
- (UIColor *)ys_normalTitleColor;

- (void)ys_setHighlightedTitleColor:(UIColor *)color;
- (UIColor *)ys_highlightedTitleColor;

- (void)ys_setDisabledTitleColor:(UIColor *)color;
- (UIColor *)ys_disabledTitleColor;

- (void)ys_setSelectedTitleColor:(UIColor *)color;
- (UIColor *)ys_selectedTitleColor;

#pragma mark - *********** Target.action ***********

- (instancetype)ys_addTarget:(id)target action:(SEL)action;

#pragma mark - *********** Title ***********

- (void)ys_setNormalTitle:(NSString *)title;
- (NSString *)ys_normalTitle;

- (void)ys_setHighlightedTitle:(NSString *)title;
- (NSString *)ys_highlightedTitle;

- (void)ys_setDisabledTitle:(NSString *)title;
- (NSString *)ys_disabledTitle;

- (void)ys_setSelectedTitle:(NSString *)title;
- (NSString *)ys_selectedTitle;

#pragma mark - *********** Image ***********

- (void)ys_setNormalImage:(UIImage *)image;
- (UIImage *)ys_normalImage;

- (void)ys_setHighlightedImage:(UIImage *)image;
- (UIImage *)ys_highlightedImage;

- (void)ys_setDisabledImage:(UIImage *)image;
- (UIImage *)ys_disabledImage;

- (void)ys_setSelectedImage:(UIImage *)image;
- (UIImage *)ys_selectedImage;

#pragma mark - *********** BackgroundImage ***********

- (void)ys_setBackgroundNormalImage:(UIImage *)image;
- (UIImage *)ys_backgroundNormalImage;

- (void)ys_setBackgroundHighlightedImage:(UIImage *)image;
- (UIImage *)ys_backgroundHighlightedImage;

- (void)ys_setBackgroundDisabledImage:(UIImage *)image;
- (UIImage *)ys_backgroundDisabledImage;

- (void)ys_setBackgroundSelectedImage:(UIImage *)image;
- (UIImage *)ys_backgroundSelectedImage;

@end

NS_ASSUME_NONNULL_END
