//
//  TimeLineHeaderView.m
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "TimeLineHeaderView.h"

@interface TimeLineHeaderView()
{
    CGFloat commentBtnWidth;
    CGFloat commentBtnHeight;
    CGFloat MaxLabelHeight;
}

@property (nonatomic, strong) UILabel *sepLine;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *timeStampLabel;
@property (nonatomic, strong) UIImageView *avatarIV;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) CopyAbleLabel *messageTextLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, assign) BOOL isExpandNow;
@property (nonatomic, assign) NSInteger headerSection;
@property (nonatomic, strong) JGGView *jggView;

// TapBlock
@property (nonatomic, copy) TapBlcok tapBlock;
// 评论按钮的block
@property (nonatomic, copy) void(^CommentBtnClickBlock)(UIButton *commentBtn,NSInteger headerSection);

// 更多按钮的Block
@property (nonatomic, copy) void (^MoreBtnClickBlock)(UIButton *moreBtn,BOOL isExPand);

@end

@implementation TimeLineHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.sepLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1.0 / YYScreenScale())];
        self.sepLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.sepLine];
        
        
        self.avatarIV = [[UIImageView alloc]initWithFrame:CGRectMake(kGAP, kGAP, kAvatar_Size, kAvatar_Size)];
        [self addSubview:self.avatarIV];
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.avatarIV.frame)+kGAP, kGAP,kScreenWidth-kAvatar_Size-2*kGAP-kGAP, self.avatarIV.frame.size.height/2)];
        self.userNameLabel.font = [UIFont systemFontOfSize:14.0];
        self.userNameLabel.textColor = [UIColor colorWithRed:(54/255.0) green:(71/255.0) blue:(121/255.0) alpha:0.9];
        
        [self addSubview:self.userNameLabel];
        
        self.timeStampLabel = [[UILabel alloc]init];
        self.timeStampLabel.font = [UIFont systemFontOfSize:12.0];
        self.timeStampLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.timeStampLabel];
        
        self.messageTextLabel = [[CopyAbleLabel alloc]init];
        self.messageTextLabel.backgroundColor = [UIColor whiteColor];
        self.messageTextLabel.numberOfLines = 0;
        self.messageTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.messageTextLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:self.messageTextLabel];
        
        commentBtnWidth = 60;
        commentBtnHeight = 22;
        MaxLabelHeight = 75.0;
        self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.commentBtn.backgroundColor = [UIColor whiteColor];
        [self.commentBtn setTitle:@"评论" forState:UIControlStateNormal];
        [self.commentBtn setTitle:@"评论" forState:UIControlStateSelected];
        [self.commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.commentBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.commentBtn.layer.borderWidth = 1;
        self.commentBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.commentBtn setImage:[UIImage imageNamed:@"commentBtn"] forState:UIControlStateNormal];
        [self.commentBtn setImage:[UIImage imageNamed:@"commentBtn"] forState:UIControlStateSelected];
        
        [self.commentBtn addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.commentBtn];
        
        
        self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreBtn setTitle:@"全文" forState:UIControlStateNormal];
        [self.moreBtn setTitle:@"收起" forState:UIControlStateSelected];
        [self.moreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        self.moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [self.moreBtn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.moreBtn];
        self.isExpandNow = NO;
        self.jggView = [[JGGView alloc] init];
        [self addSubview:self.jggView];
    }
    return self;
}

- (void)commentAction:(UIButton *)sender
{
    if (self.CommentBtnClickBlock)
    {
        self.CommentBtnClickBlock(sender, self.headerSection);
    }
}

- (void)moreAction:(UIButton *)sender
{
    if (self.MoreBtnClickBlock)
    {
        self.MoreBtnClickBlock(sender, _isExpandNow);
    }
}

- (void)setMdoel:(MessageInfoModel2 *)mdoel
{
     [self.avatarIV sd_setImageWithURL:[NSURL URLWithString:mdoel.photo] placeholderImage:PLACE_IMAGE];
    self.userNameLabel.text = mdoel.userName;
    self.messageTextLabel.attributedText = mdoel.mutablAttrStr;
    self.messageTextLabel.frame = mdoel.textLayout.frameLayout;
    // 解决图片复用的问题
    [self.jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.jggView.dataSource = mdoel.messageSmallPics;
    self.jggView.frame = mdoel.jggLayout.frameLayout;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
