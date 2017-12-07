//
//  FriendInfoModel.m
//  WeChat
//
//  Created by 张帅 on 2017/10/24.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "FriendInfoModel.h"

@implementation FriendInfoModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.userId = dic[@"userId"];
        self.userName = dic[@"userName"];
        self.photo = dic[@"photo"];
        self.phoneNO = dic[@"photoNO"];
    }
    return self;
}

@end
