//
//  MessageInfoModel1.m
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "MessageInfoModel1.h"
#import "CommentInfoModel1.h"
#import "FriendInfoModel.h"

@implementation MessageInfoModel1

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.cid                = dic[@"cid"];
        self.shouldUpdateCache  = NO;
        self.message_id         = dic[@"message_id"];
        self.message            = dic[@"message"];
        self.timeTag            = dic[@"timeTag"];
        self.message_type       = dic[@"message_type"];
        self.userId             = dic[@"userId"];
        self.userName           = dic[@"userName"];
        for (NSDictionary *friendInfoDic in dic[@"likeUsers"])
        {
            FriendInfoModel *model = [[FriendInfoModel alloc]initWithDic:friendInfoDic];
            [self.likeUsers addObject:model];
        }
        self.photo              = dic[@"photo"];
        self.messageSmallPics   = dic[@"messageSmallPics"];
        self.messageBigPics     = dic[@"messageBigPics"];
        if (self.likeUsers.count)
        {
            [self.commentModelArray addObject:self.likeUsers];
        }
        for (NSDictionary *eachDic in dic[@"commentMessages"])
        {
            CommentInfoModel1 *commentModel = [[CommentInfoModel1 alloc]initWithDic:eachDic];
            [self.commentModelArray addObject:commentModel];
        }
    }
    return self;
}

- (NSMutableArray *)commentModelArray
{
    if (_commentModelArray == nil)
    {
        _commentModelArray = [NSMutableArray array];
    }
    return _commentModelArray;
}

- (NSMutableArray *)messageSmallPics
{
    if (_messageSmallPics == nil)
    {
        _messageSmallPics = [NSMutableArray array];
    }
    return _messageSmallPics;
}

- (NSMutableArray *)messageBigPics
{
    if (_messageBigPics == nil)
    {
        _messageBigPics = [NSMutableArray array];
    }
    return _messageBigPics;
}

- (NSMutableArray *)likeUsers
{
    if (_likeUsers == nil)
    {
        _likeUsers = [NSMutableArray array];
    }
    return _likeUsers;
}


@end
