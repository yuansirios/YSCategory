//
//  NSDecimalNumber+YSAddtion.h
//  Pods
//
//  Created by yuan on 2018/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (YSAddtion)

//TODO:加
+ (NSString *)ys_decimalNumberByAdding:(double)arg1
                                  arg2:(double)arg2
                                 model:(NSRoundingMode)roundMode
                                 scale:(short)scale;

//TODO:减
+ (NSString *)ys_decimalNumberBySubtracting:(double)arg1
                                       arg2:(double)arg2
                                      model:(NSRoundingMode)roundMode
                                      scale:(short)scale;

//TODO:乘
+ (NSString *)ys_decimalNumberByMultiplyingBy:(double)arg1
                                         arg2:(double)arg2
                                        model:(NSRoundingMode)roundMode
                                        scale:(short)scale;

//TODO:除
+ (NSString *)ys_decimalNumberByDividingBy:(double)arg1
                                      arg2:(double)arg2
                                     model:(NSRoundingMode)roundMode
                                     scale:(short)scale;

//TODO:次方
+ (NSString *)ys_decimalNumberByRaisingToPower:(double)arg1
                                         power:(NSUInteger)power
                                         model:(NSRoundingMode)roundMode
                                         scale:(short)scale;

//TODO:10为底乘方
+ (NSString *)ys_decimalNumberByMultiplyingByPowerOf10:(double)arg1
                                                 power:(NSUInteger)power
                                                 model:(NSRoundingMode)roundMode
                                                 scale:(short)scale;

//TODO:输出double值而不丢失精度
+ (NSString *)ys_stringWithDouble:(double)doubleNum;

//TODO:转换NSDecimalNumber 对象
+ (NSDecimalNumber *)ys_decimalNumberWithDouble:(double)doubleNum;

/**
 //TODO:遍历构建
 
 @param roundingMode 舍入方式
 NSRoundPlain:四舍五入
 NSRoundDown:只舍不入
 NSRoundUp：只入不舍
 NSRoundBankers: 在四舍五入的基础上加了一个判断：当最后一位为5的时候，只会舍入成偶数。比如：1.25不会返回1.3而是1.2，因为1.3不是偶数。
 @return NSDecimalNumberHandler对象
 */

+ (NSDecimalNumberHandler *)ys_decimalNumberHandler:(NSRoundingMode)roundingMode
                                              scale:(short)scale;

@end

NS_ASSUME_NONNULL_END
