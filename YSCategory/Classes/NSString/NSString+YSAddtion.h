//
//  NSString+YSAddtion.h
//  Pods
//
//  Created by yuan on 2018/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YSAddtion)

#pragma mark - Drawing

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

- (CGFloat)widthForFont:(UIFont *)font;

- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

#pragma mark - *********** 文件读取 ***********

+ (NSString *)stringNamed:(NSString *)name;

#pragma mark - *********** 常用 ***********

+ (NSString *)stringWithUUID;

- (NSMutableDictionary *)getURLParameters;

@end

NS_ASSUME_NONNULL_END
