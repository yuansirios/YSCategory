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
#import <YSCategory/NSDecimalNumber+YSAddtion.h>

@interface YSViewController ()

@end

@implementation YSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self testView];
    [self testDecimalNumber];
}

#pragma mark - *********** testView ***********

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

#pragma mark - *********** testDecimalNumber ***********

- (void)testDecimalNumber{
    NSString *jsonStr = @"{\"9.701\":9.701, \"97.406\":97.406, \"80.404\":80.404, \"188.405\":188.405}";
    NSLog(@"json:%@", jsonStr);
    
    NSData *jsonData_ = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonParsingError_ = nil;
    NSDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:jsonData_ options:0 error:&jsonParsingError_]];
    
    for (int i = 0 ; i < [dic allValues].count ; i ++) {
        
        double d = [[dic allValues][i] doubleValue];
        
        NSLog(@"str1 : %@",[dic allValues][i]);
        NSLog(@"str2 : %g",d);
        NSLog(@"str3 : %lf",d);
        NSLog(@"str4 : %@",[NSDecimalNumber ys_stringWithDouble:d]);
    }
    
    NSString *str = [NSDecimalNumber ys_decimalNumberByAdding:7.12 arg2:4.101 model:NSRoundPlain scale:5];
    NSLog(@"加：%@",str);
    
    str = [NSDecimalNumber ys_decimalNumberBySubtracting:7.12 arg2:4.101 model:NSRoundPlain scale:5];
    NSLog(@"减：%@",str);
    
    str = [NSDecimalNumber ys_decimalNumberByMultiplyingBy:7.12 arg2:4.101 model:NSRoundPlain scale:5];
    NSLog(@"乘：%@",str);
    
    str = [NSDecimalNumber ys_decimalNumberByDividingBy:7.12 arg2:4.101 model:NSRoundPlain scale:5];
    NSLog(@"除：%@",str);
    
    str = [NSDecimalNumber ys_decimalNumberByRaisingToPower:7.12 power:3 model:NSRoundPlain scale:5];
    NSLog(@"次方：%@",str);
    
    str = [NSDecimalNumber ys_decimalNumberByMultiplyingByPowerOf10:5.123 power:3 model:NSRoundPlain scale:3];
    NSLog(@"10为底乘方：%@",str);
}

@end
