//
//  MessageInfoModel1.h
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentInfoModel1.h"
#import "FriendInfoModel.h"

@interface MessageInfoModel1 : NSObject

@property (nonatomic, copy) NSString *cid;

// 发布说说的ID
@property (nonatomic, copy) NSString *message_id;

// 发布说说的内容
@property (nonatomic, copy) NSString *message;

// 发布说说的展开状态
@property (nonatomic, assign) BOOL isEcpand;

// 发布说说的时间标签
@property (nonatomic, copy) NSString *timeTag;

// 发布说说的类型(可能含有视频)
@property (nonatomic, copy) NSString *message_type;

// 发布说说者的id
@property (nonatomic, copy) NSString *userId;

// 发布说说者的名字
@property (nonatomic, copy) NSString *userName;

// 点赞的人列表
@property (nonatomic, copy) NSMutableArray <FriendInfoModel *> *likeUsers;

// 发布说说者头像
@property (nonatomic, copy) NSString *photo;

// 评论小图
@property (nonatomic, copy) NSMutableArray *messageSmallPics;

// 评论大图
@property (nonatomic, copy) NSMutableArray *messageBigPics;

// 评论相关的所有信息
@property (nonatomic, copy) NSMutableArray *commentModelArray;

@property (nonatomic, assign) BOOL shouldUpdateCache;

@property (nonatomic, copy) NSMutableAttributedString *mutablAttrStr;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
