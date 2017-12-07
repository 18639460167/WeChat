//
//  LikeUsersCell.h
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendInfoModel;
#import "MessageInfoModel2.h"

typedef void (^TapNameBlock)(FriendInfoModel *friendModel);
@interface LikeUsersCell : UITableViewCell

// 展示点赞人列表的label
@property (nonatomic, strong) UILabel *likeUsersLabel;

@property (nonatomic, strong) NSMutableArray *likeUsersArray;

@property (nonatomic, strong) CommentInfoModel2 *model;

// 点击某个人名字的block回调
@property (nonatomic, copy) TapNameBlock tapNameBlock;

@end
