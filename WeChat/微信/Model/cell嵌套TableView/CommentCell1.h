//
//  CommentCell1.h
//  WeChat
//
//  Created by 张帅 on 2017/10/27.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentInfoModel1.h"

@interface CommentCell1 : UITableViewCell

// 处理评论的文字(包括xx回复yy)
- (void)configCellWithModel:(CommentInfoModel1 *)model;

@end
