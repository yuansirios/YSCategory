//
//  UIButton+YSAddtion.m
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import "UIButton+YSAddtion.h"

@implementation UIButton (YSAddtion)

#pragma mark - *********** TitleLabel Alignment ***********

- (void)ys_titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                       verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                       contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {
    
    self.contentHorizontalAlignment = horizontalAlignment;
    self.contentVerticalAlignment   = verticalAlignment;
    self.contentEdgeInsets          = contentEdgeInsets;
}

#pragma mark - *********** Target.action ***********

- (instancetype)ys_addTarget:(id)target action:(SEL)action {
    
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return self;
}

#pragma mark - *********** Title Color ***********

- (void)ys_setNormalTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (UIColor *)ys_normalTitleColor {
    
    return [self titleColorForState:UIControlStateNormal];
}

- (void)ys_setHighlightedTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateHighlighted];
}

- (UIColor *)ys_highlightedTitleColor {
    
    return [self titleColorForState:UIControlStateHighlighted];
}

- (void)ys_setDisabledTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateDisabled];
}

- (UIColor *)ys_disabledTitleColor {
    
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)ys_setSelectedTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (UIColor *)ys_selectedTitleColor {
    
    return [self titleColorForState:UIControlStateSelected];
}

#pragma mark - *********** Title ***********

- (void)ys_setNormalTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)ys_normalTitle {
    
    return [self titleForState:UIControlStateNormal];
}

- (void)ys_setHighlightedTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (NSString *)ys_highlightedTitle {
    
    return [self titleForState:UIControlStateHighlighted];
}

- (void)ys_setDisabledTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateDisabled];
}

- (NSString *)ys_disabledTitle {
    
    return [self titleForState:UIControlStateDisabled];
}

- (void)ys_setSelectedTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateSelected];
}

- (NSString *)ys_selectedTitle {
    
    return [self titleForState:UIControlStateSelected];
}

#pragma mark - *********** Image ***********

- (void)ys_setHighlightedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)ys_highlightedImage {
    
    return [self imageForState:UIControlStateHighlighted];
}

- (void)ys_setSelectedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)ys_selectedImage {
    
    return [self imageForState:UIControlStateSelected];
}

- (void)ys_setNormalImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)ys_normalImage {
    
    return [self imageForState:UIControlStateNormal];
}

- (void)ys_setDisabledImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateDisabled];
}

- (UIImage *)ys_disabledImage {
    
    return [self imageForState:UIControlStateDisabled];
}

#pragma mark - *********** BackgroundImage ***********

- (void)ys_setBackgroundNormalImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (UIImage *)ys_backgroundNormalImage {
    
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)ys_setBackgroundHighlightedImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)ys_backgroundHighlightedImage {
    
    return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)ys_setBackgroundDisabledImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateDisabled];
}

- (UIImage *)ys_backgroundDisabledImage {
    
    return [self backgroundImageForState:UIControlStateDisabled];
}

- (void)ys_setBackgroundSelectedImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

- (UIImage *)ys_backgroundSelectedImage {
    
    return [self backgroundImageForState:UIControlStateSelected];
}

@end
