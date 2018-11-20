//
//  YSViewController.m
//  YSCategory
//
//  Created by yuansirios on 10/18/2018.
//  Copyright (c) 2018 yuansirios. All rights reserved.
//

#import "YSViewController.h"
#import <YSCategory/UIView+HUD.h>
#import <YSCategory/UIView+YSAddtion.h>
#import <YSCategory/NSString+YSAddtion.h>
#import <YSCategory/NSString+YSRegexKit.h>
#import <YSCategory/UIButton+YSAddtion.h>
#import <YSCategory/UIImage+YSAddtion.h>

@interface YSViewController ()

@end

@implementation YSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self testView];
}

- (void)testView{
    UIButton *btn = UIButton.new;
    btn.left = 20;
    btn.top = 50;
    btn.width = 100;
    btn.height = 50;
    [self.view addSubview:btn];
    
    [btn ys_setNormalImage:[UIImage ys_imageWithSize:CGSizeMake(20, 20) color:UIColor.yellowColor]];
    
    [btn ys_setBackgroundNormalImage:[UIImage ys_imageWithSize:CGSizeMake(1, 1) color:UIColor.greenColor]];
    
    [btn ys_setNormalTitle:@"我是一个按钮"];
    [btn ys_addTarget:self action:@selector(click:)];
}

- (void)click:(UIButton *)sender{
    NSLog(@"%@",sender);
    
    [self.view ys_showLoadingWithTitle:@"加载中"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view ys_hidHUD];
            [self.view ys_showToastInMidView:@"完成了！"];
        });
    });
}

@end
