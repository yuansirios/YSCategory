//
//  NSString+YSAddtion.m
//  Pods
//
//  Created by yuan on 2018/10/18.
//

#import "NSString+YSAddtion.h"

@implementation NSString (YSAddtion)

#pragma mark - *********** Drawing ***********

- (CGSize)ys_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)ys_widthForFont:(UIFont *)font {
    CGSize size = [self ys_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGFloat)ys_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self ys_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

#pragma mark - *********** Range ***********

- (NSArray <NSValue *> *)ys_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range {
    
    NSMutableArray *array = [NSMutableArray array];
    [self ys_rangeOfString:searchString range:NSMakeRange(0, self.length) array:array options:mask];
    
    return array;
}

- (void)ys_rangeOfString:(NSString *)searchString
                   range:(NSRange)searchRange
                   array:(NSMutableArray *)array
                 options:(NSStringCompareOptions)mask {
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    if (range.location != NSNotFound) {
        [array addObject:[NSValue valueWithRange:range]];
        [self ys_rangeOfString:searchString
                         range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length))
                         array:array
                       options:mask];
    }
}

#pragma mark - *********** 文件读取 ***********

+ (NSString *)ys_stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

#pragma mark - *********** 常用 ***********

+ (NSString *)ys_stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

//通过url.query获取参数字符 再分成字典
- (NSMutableDictionary *)ys_getURLParameters{
    if (!self.length) {
        return nil;
    }
    NSMutableDictionary  *params = [NSMutableDictionary   dictionary];
    if ([self containsString:@"&"]) {
        NSArray *urlComponents = [self componentsSeparatedByString:@"&"];
        
        for(NSString *keyValuePair in urlComponents) {
            
            //生成key/value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString*value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            //key不能为nil
            
            if(key==nil|| value ==nil) continue;
            
            id existValue = [params valueForKey:key];
            if(existValue !=nil) {
                //已存在的值，生成数组。
                if([existValue isKindOfClass:[NSArray class]]) {
                    //已存在的值生成数组
                    NSMutableArray*items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    [params setValue:items forKey:key];
                }else{
                    //非数组
                    [params setValue:@[existValue,value]forKey:key];
                }
                
            }else{
                //设置值
                [params setValue:value forKey:key];
            }
            
        }
    }else {
        //单个参数生成key/value
        NSArray *pairComponents = [self componentsSeparatedByString:@"="];
        if(pairComponents.count==1) {
            return nil;
        }
        //分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        //key不能为nil
        if(key ==nil|| value ==nil)return nil;
        //设置值
        [params setValue:value forKey:key];
        
    }
    return params;
}

#pragma mark - *********** 内容处理 ***********

+ (NSString *)ys_transformToPinYin{
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [self mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    NSLog(@"%@", pinyin);
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    //返回最近结果
    return pinyin;
}

@end
