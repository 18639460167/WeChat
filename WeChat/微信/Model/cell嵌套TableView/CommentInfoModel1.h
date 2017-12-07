//
//  CommentInfoModel1.h
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentInfoModel1 : NSObject

@property (nonatomic, assign) BOOL isExpand;
@property (nonatomic, copy) NSString *commentId;
@property (nonatomic, copy) NSString *commentUserId;
@property (nonatomic, copy) NSString *commentUserName;
@property (nonatomic, copy) NSString *commentPhoto;
@property (nonatomic, copy) NSString *commentText;
@property (nonatomic, copy) NSString *commentByUserId;
@property (nonatomic, copy) NSString *commentByUserName;
@property (nonatomic, copy) NSString *commentByPhoto;
@property (nonatomic, copy) NSString *createDateStr;
@property (nonatomic, copy) NSString *checkStatus;

// 评论大图
@property (nonatomic, copy) NSMutableArray *messageBigPicArray;

// 评论数据源
@property (nonatomic, copy) NSMutableArray *commentModelArray;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
