//
//  NSString+Extension.h
//  WeChat
//
//  Created by 张帅 on 2017/10/23.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)


/**
 * 计算文字高度
 */
- (CGSize)boundingRectWithSize:(CGSize)size paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle font:(UIFont *)font;

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

/**
 * 计算最大行术文字高度，可以处理计算带行间距的
 */
- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;

/**
 * 计算是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing;

@end
