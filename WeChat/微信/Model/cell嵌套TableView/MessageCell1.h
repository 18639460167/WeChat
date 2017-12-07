//
//  MessageCell1.h
//  WeChat
//
//  Created by 张帅 on 2017/10/27.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGGView.h"
#import "CommentCell1.h"
#import "LikeUserCell1.h"
#import "MessageInfoModel1.h"
#import "CommentInfoModel1.h"

@class MessageCell1;

@protocol MessageCellDelegate <NSObject>

- (void)reloadCellHeightForModel:(MessageInfoModel1 *)model atIndexPath:(NSIndexPath *)indexPath;

- (void)passCellHeight:(CGFloat )cellHeight commentModel:(CommentInfoModel1 *)commentModel   commentCell:(CommentCell1 *)commentCell messageCell:(MessageCell1 *)messageCell;

@end

@interface MessageCell1 : UITableViewCell

@property (nonatomic, strong) JGGView *jggView;

/**
 * 评论按钮的block
 */
@property (nonatomic, copy) void(^CommentBtnClickBlock)(UIButton *commentBtn,NSIndexPath *indexPath);

/**
 * 更多按钮的block
 */
@property (nonatomic, copy) void(^MoreBtnClockBlock)(UIButton *moreBtn,NSIndexPath *indexPath);

/**
 * 点击图片的block
 */
@property (nonatomic, copy) TapBlcok tapImageBlock;

/**
 * 点击文字的block
 */
@property (nonatomic, copy) void (^TaptextBlock)(UILabel *desLabel);
@property (nonatomic, copy) TapNameBlock tapNameBlock;

@property (nonatomic, weak) id<MessageCellDelegate>delegate;

- (void)configCellWithModel:(MessageInfoModel1 *)model indexPatch:(NSIndexPath *)indexPatch;


@end
