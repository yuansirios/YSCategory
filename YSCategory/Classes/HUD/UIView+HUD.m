//
//  UIView+HUD.m
//  Pods
//
//  Created by yuan on 2018/11/20.
//

#import "UIView+HUD.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, @selector(HUD), HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ys_showToastInMidView:(NSString *)title{
    [self ys_showToast:title yoffset:0];
}

- (void)ys_showToast:(NSString *)title yoffset:(CGFloat)yoffset{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = title;
    hud.detailsLabel.font = [UIFont systemFontOfSize:16.];
    hud.margin = 10.;
    hud.offset = CGPointMake(hud.offset.x, hud.offset.y + yoffset);
    hud.removeFromSuperViewOnHide = YES;
    [self setCustomStyle:hud];
    [hud hideAnimated:YES afterDelay:1];
}

- (void)ys_showLoadingWithTitle:(NSString *)title{
    [self ys_showLoadingWithTitle:title yoffset:0];
}

- (void)ys_showLoadingWithTitle:(NSString *)title yoffset:(CGFloat)yoffset{
    if ([self HUD]) {
        return;
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.label.text = title;
    hud.offset = CGPointMake(hud.offset.x, hud.offset.y + yoffset);
    [self setCustomStyle:hud];
    [self addSubview:hud];
    [hud showAnimated:YES];
    [self setHUD:hud];
}

- (void)ys_hidHUD{
    [[self HUD] hideAnimated:YES];
    [[self HUD] removeFromSuperview];
    [self setHUD:nil];
}

- (void)setCustomStyle:(MBProgressHUD *)hud{
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor.blackColor colorWithAlphaComponent:0.8];
    hud.contentColor = UIColor.whiteColor;
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
}

@end
