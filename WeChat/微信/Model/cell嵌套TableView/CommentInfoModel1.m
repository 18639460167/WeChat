//
//  CommentInfoModel1.m
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "CommentInfoModel1.h"

@implementation CommentInfoModel1

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.commentId          = dic[@"commentId"];
        self.commentUserId      = dic[@"commentUserId"];
        self.commentUserName    = dic[@"commentUserName"];
        self.commentPhoto       = dic[@"commentPhoto"];
        self.commentText        = dic[@"commentText"];
        self.commentByUserId    = dic[@"commentByUserId"];
        self.commentByUserName  = dic[@"commentByUserName"];
        self.commentByPhoto     = dic[@"commentByPhoto"];
        self.createDateStr      = dic[@"createDateStr"];
        self.checkStatus        = dic[@"checkStatus"];
    }
    return self;
}

- (NSMutableArray *)commentModelArray
{
    if (_commentModelArray == nil)
    {
        _commentModelArray = [[NSMutableArray alloc]init];
    }
    return _commentModelArray;
}

- (NSMutableArray *)messageBigPicArray
{
    if (_messageBigPicArray == nil)
    {
        _messageBigPicArray = [NSMutableArray array];
    }
    return _messageBigPicArray;
}

@end
