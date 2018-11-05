//
//  NSString+YSRegexKit.h
//  YSRegexKit_Example
//
//  Created by yuan on 2018/11/2.
//  Copyright © 2018年 yuansirios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YSValidCharsType_AllNumber, //全部数字
    YSValidCharsType_AllWords,  //全部字母
    YSValidCharsType_AllChinese,//只能输入汉字
    YSValidCharsType_AllWordsAndNumbers,  //是否都是字母和数字
    YSValidCharsType_AllWordsAndNumbers_6_16,//是否都是字母和数字且长度在[6,16]
} YSValidCharsType;

@interface NSString (YSRegexKit)

#pragma mark - *********** 正则封装 ***********

- (BOOL)ys_isValidateByRegex:(NSString *)regex;

#pragma mark - *********** 手机号判断 ***********

- (BOOL)ys_isValidPhoneNumber;

- (NSDictionary *)ys_isValidMobileNumberClassification;

#pragma mark - *********** 邮箱 ***********

- (BOOL)ys_isEmailAddress;

#pragma mark - *********** 网址校验 ***********

- (BOOL)ys_isValidUrl;

#pragma mark - *********** 简单身份证 ***********

- (BOOL)ys_isValidCardNum;

#pragma mark - *********** 银行卡验证 ***********

- (BOOL)ys_isValidBankCard;

#pragma mark - *********** 车牌号 ***********

- (BOOL)ys_isValidCarID;

#pragma mark - *********** 车牌号 ***********

/**
 核对密码格式,6~16位数字/字母/下划线
 */
- (BOOL)ys_isValidPassword;

#pragma mark - *********** 字符判断 ***********

- (BOOL)ys_isValidChars:(YSValidCharsType)type;

#pragma mark - *********** 验证IP地址 ***********

- (BOOL)ys_isValidIPAddress;

@end

NS_ASSUME_NONNULL_END
