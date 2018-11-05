//
//  NSString+YSRegexKit.m
//  YSRegexKit_Example
//
//  Created by yuan on 2018/11/2.
//  Copyright © 2018年 yuansirios. All rights reserved.
//

#import "NSString+YSRegexKit.h"

@implementation NSString (YSRegexKit)

#pragma mark - *********** 正则封装 ***********

- (BOOL)ys_isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

#pragma mark - *********** 手机号判断 ***********

//因为各个运营商开头号码不同，这里只匹配11位是比较好的方法
- (BOOL)ys_isValidPhoneNumber {
    NSString *regex = @"^[0-9]{11}";
    return [self ys_isValidateByRegex:regex];
}

//或者精确点，但需要根据运营商更新
- (NSDictionary *)ys_isValidMobileNumberClassification {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12
     */
    NSString * CM = @"^134[0-8]\\d{7}$|^(?:13[5-9]|147|15[0-27-9]|178|1703|1705|1706|18[2-478])\\d{7,8}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17
     */
    NSString * CU = @"^(?:13[0-2]|145|15[56]|176|1704|1707|1708|1709|171|18[56])\\d{7,8}|$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22
     */
    NSString * CT = @"^(?:133|153|1700|1701|1702|177|173|18[019])\\d{7,8}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28
     */
    NSString * PHS = @"^0(10|2[0-5789]|\\\\d{3})\\\\d{7,8}$";
    
    NSString *type;
    BOOL isValid;
    
    if ([self ys_isValidateByRegex:CM]) {
        type = @"移动";
        isValid = YES;
    }else if ([self ys_isValidateByRegex:CU]) {
        type = @"联通";
        isValid = YES;
    }else if ([self ys_isValidateByRegex:CT]) {
        type = @"电信";
        isValid = YES;
    }else if ([self ys_isValidateByRegex:PHS]) {
        type = @"大陆地区固话及小灵通";
        isValid = YES;
    }else{
        type = @"未识别";
        isValid = NO;
    }
    return @{@"type":type,@"isValid":@(isValid)};
}

#pragma mark - *********** 邮箱 ***********

/**
 @之前必须有内容且只能是字母（大小写）、数字、下划线(_)、减号（-）、点（.）
 
 @和最后一个点（.）之间必须有内容且只能是字母（大小写）、数字、点（.）、减号（-），且两个点不能挨着
 
 最后一个点（.）之后必须有内容且内容只能是字母（大小写）、数字且长度为大于等于2个字节，小于等于6个字节
 */
- (BOOL)ys_isEmailAddress {
    NSString *emailRegex = @"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$";
    return [self ys_isValidateByRegex:emailRegex];
}

#pragma mark - *********** 网址校验 ***********

- (BOOL)ys_isValidUrl {
    NSString * regex = @"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    return [self ys_isValidateByRegex:regex];
}

#pragma mark - *********** 简单身份证 ***********

- (BOOL)ys_isValidCardNum {

    //长度不为18的都排除掉
    if (self.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    BOOL flag = [self ys_isValidateByRegex:regex2];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++){
            NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]){
                return YES;
            }else{
                return NO;
            }
        }
    }
}

#pragma mark - *********** 银行卡验证 ***********

- (BOOL)ys_isValidBankCard{
    if (self.length < 16) {
        return NO;
    }
    NSInteger oddsum = 0;     //奇数求和
    NSInteger evensum = 0;    //偶数求和
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[self length];
    // 取了最后一位数
    NSInteger lastNum = [[self substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    NSString *bankCard = [self substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
            if((i % 2) == 0){//偶数位置
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{//奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

#pragma mark - *********** 车牌号 ***********

- (BOOL)ys_isValidCarID{
    
    if (self.length == 7) {
        //普通汽车，7位字符，不包含I和O，避免与数字1和0混淆
        NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-np-zA-HJ-NP-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{4}[a-hj-np-zA-HJ-NP-Z0-9\u4e00-\u9fa5]$";
        return [self ys_isValidateByRegex:carRegex];
    }else if(self.length == 8){
        //新能源车,8位字符，第一位：省份简称（1位汉字），第二位：发牌机关代号（1位字母）;
        //小型车，第三位：只能用字母D或字母F，第四位：字母或者数字，后四位：必须使用数字;([DF][A-HJ-NP-Z0-9][0-9]{4})
        //大型车3-7位：必须使用数字，后一位：只能用字母D或字母F。([0-9]{5}[DF])
        NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-np-zA-HJ-NP-Z]{1}([0-9]{5}[d|f|D|F]|[d|f|D|F][a-hj-np-zA-HJ-NP-Z0-9][0-9]{4})$";
        return [self ys_isValidateByRegex:carRegex];
    }
    return NO;
}

#pragma mark - *********** 车牌号 ***********

/**
 核对密码格式,6~16位数字/字母/下划线
 */
- (BOOL)ys_isValidPassword{
    NSString * pattern  = @"^[A-Za-z0-9_]{6,16}$";
    return [self ys_isValidateByRegex:pattern];
}

#pragma mark - *********** 字符判断 ***********

- (BOOL)ys_isValidChars:(YSValidCharsType)type{
    
    NSString *condition = @"^[0-9]*$";//是否都是数字;
    
    if (type == YSValidCharsType_AllNumber) {
        condition = @"^[0-9]*$";//是否都是数字
    }else if (type == YSValidCharsType_AllWords) {
        condition = @"^[A-Za-z]+$";//是否都是字母
    }else if (type == YSValidCharsType_AllChinese) {
        condition = @"^[\u4e00-\u9fa5]{0,}$";//只能输入汉字
    }else if (type == YSValidCharsType_AllWordsAndNumbers) {
        condition = @"^[A-Za-z0-9]+$";//是否都是字母和数字
    }else if (type == YSValidCharsType_AllWordsAndNumbers_6_16) {
        condition = @"^[A-Za-z0-9]{6,16}$";//是否都是字母和数字且长度在[6,16]
    }
    return [self ys_isValidateByRegex:condition];
}

#pragma mark - *********** 验证IP地址 ***********

- (BOOL)ys_isValidIPAddress {
    NSString *regex = [NSString stringWithFormat:@"^(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})$"];
    BOOL rc = [self ys_isValidateByRegex:regex];
    
    if (rc) {
        NSArray *componds = [self componentsSeparatedByString:@","];
        
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        
        return v;
    }
    
    return NO;
}

@end
