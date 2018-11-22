//
//  NSDecimalNumber+YSAddtion.m
//  Pods
//
//  Created by yuan on 2018/11/22.
//

#import "NSDecimalNumber+YSAddtion.h"

@implementation NSDecimalNumber (YSAddtion)

//TODO:加
+ (NSString *)ys_decimalNumberByAdding:(double)arg1
                                  arg2:(double)arg2
                                 model:(NSRoundingMode)roundMode
                                 scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    NSDecimalNumber *arg2Number = [self ys_decimalNumberWithDouble:arg2];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberByAdding:arg2Number
                                                   withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:减
+ (NSString *)ys_decimalNumberBySubtracting:(double)arg1
                                       arg2:(double)arg2
                                      model:(NSRoundingMode)roundMode
                                      scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    NSDecimalNumber *arg2Number = [self ys_decimalNumberWithDouble:arg2];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberBySubtracting:arg2Number
                                                        withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:乘
+ (NSString *)ys_decimalNumberByMultiplyingBy:(double)arg1
                                         arg2:(double)arg2
                                        model:(NSRoundingMode)roundMode
                                        scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    NSDecimalNumber *arg2Number = [self ys_decimalNumberWithDouble:arg2];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberByMultiplyingBy:arg2Number
                                                          withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:除
+ (NSString *)ys_decimalNumberByDividingBy:(double)arg1
                                      arg2:(double)arg2
                                     model:(NSRoundingMode)roundMode
                                     scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    NSDecimalNumber *arg2Number = [self ys_decimalNumberWithDouble:arg2];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberByDividingBy:arg2Number
                                                       withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:次方
+ (NSString *)ys_decimalNumberByRaisingToPower:(double)arg1
                                         power:(NSUInteger)power
                                         model:(NSRoundingMode)roundMode
                                         scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberByRaisingToPower:power
                                                           withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:10为底乘方
+ (NSString *)ys_decimalNumberByMultiplyingByPowerOf10:(double)arg1
                                                 power:(NSUInteger)power
                                                 model:(NSRoundingMode)roundMode
                                                 scale:(short)scale{
    
    NSDecimalNumber *arg1Number = [self ys_decimalNumberWithDouble:arg1];
    
    NSDecimalNumberHandler *handler = [self ys_decimalNumberHandler:roundMode scale:scale];
    
    NSDecimalNumber *number = [arg1Number decimalNumberByMultiplyingByPowerOf10:power
                                                                   withBehavior:handler];
    
    double result = [[number stringValue] doubleValue];
    
    return [NSString stringWithFormat:@"%.*lf",scale,result];
}

//TODO:输出double值而不丢失精度
+ (NSString *)ys_stringWithDouble:(double)doubleNum{
    return [self ys_decimalNumberWithDouble:doubleNum].stringValue;
}

//TODO:转换NSDecimalNumber 对象
+ (NSDecimalNumber *)ys_decimalNumberWithDouble:(double)doubleNum{
    NSString *str = [NSString stringWithFormat:@"%lf", doubleNum];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:str];
    return decNumber;
}

//TODO:遍历构建
/*
 scale 小数点后舍入值的位数。
 exact 精度错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 overflow 溢出错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 underflow 下溢错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 divideByZero 除以0的错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 */
+ (NSDecimalNumberHandler *)ys_decimalNumberHandler:(NSRoundingMode)roundingMode
                                              scale:(short)scale{
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:roundingMode
                                       scale:scale
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    return handler;
}

@end
