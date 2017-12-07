//
//  LikeUserCell1.h
//  WeChat
//
//  Created by 张帅 on 2017/10/27.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendInfoModel;
#import "MessageInfoModel1.h"

typedef void (^TapNameBlock)(FriendInfoModel *friendModel);
@interface LikeUserCell1 : UITableViewCell

@property (nonatomic, strong) UILabel *likeUsersLabel;
@property (nonatomic, copy) TapNameBlock tapNameBlock;
@property (nonatomic, strong) MessageInfoModel1 *model;


@end
