//
//  UILabel+TapAction.h
//  WeChat
//
//  Created by 张帅 on 2017/10/23.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapActionDelegate<NSObject>
@optional


/**
 TapActionDelegate

 @param string 点击的字符串
 @param range 点击的字符串range
 @param index 点击的字符在数组中的index
 */
- (void)tapReturnString:(NSString *)string
                  range:(NSRange)range
                  index:(NSInteger)index;
@end

@interface AttributeModel : NSObject

@property (nonatomic, copy) NSString *str;
@property (nonatomic, assign) NSRange range;

@end

@interface UILabel (TapAction)

/**
 * 是否打开点击效果，默认是打开
 */
@property (nonatomic, assign) BOOL enabledTapEffect;


/**
 给文本添加点击事件

 @param strings  需要添加的字符串数组
 @param tapClick 点击事件回调
 */
- (void)tapActionWithStrings:(NSArray <NSString *> *)strings
                  tapClicked:(void(^)(NSString *string, NSRange range, NSInteger index))tapClick;


/**
 给文本添加点击事件delegate回调

 @param strings  需要添加的字符串数组
 @param delegate delegate
 */
- (void)tapActionWithStrings:(NSArray <NSString *> *)strings
                     deleate:(id <TapActionDelegate> )delegate;










@end
