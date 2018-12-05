//
//  NSString+YSAddtion.h
//  Pods
//
//  Created by yuan on 2018/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YSAddtion)

#pragma mark - *********** Drawing ***********

- (CGSize)ys_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

- (CGFloat)ys_widthForFont:(UIFont *)font;

- (CGFloat)ys_heightForFont:(UIFont *)font width:(CGFloat)width;

#pragma mark - *********** Range ***********

/**
 递归搜寻NSString中重复的文本

 @param searchString 搜索内容
 @param mask 条件
 @param range 搜索范围
 @return 结果
 */
- (NSArray <NSValue *> *)ys_rangesOfString:(NSString *)searchString
                                   options:(NSStringCompareOptions)mask
                               serachRange:(NSRange)range;

#pragma mark - *********** 文件读取 ***********

+ (NSString *)ys_stringNamed:(NSString *)name;

#pragma mark - *********** 常用 ***********

+ (NSString *)ys_stringWithUUID;

- (NSMutableDictionary *)ys_getURLParameters;

#pragma mark - *********** 内容处理 ***********

+ (NSString *)ys_transformToPinYin;

@end

NS_ASSUME_NONNULL_END
