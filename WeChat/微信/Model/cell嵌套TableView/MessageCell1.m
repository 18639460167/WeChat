//
//  MessageCell1.m
//  WeChat
//
//  Created by 张帅 on 2017/10/27.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "MessageCell1.h"
#import "FriendInfoModel.h"
#import "WMPlayer.h"

@interface MessageCell1()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *nameLbl;
@property (nonatomic, strong) CopyAbleLabel *desclabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) WMPlayer *wmPlayer;
@property (nonatomic, strong) MessageInfoModel1 *messageModel1;
@property (nonatomic, copy)   NSIndexPath *indexPath;

@end

@implementation MessageCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.headImageView = [[UIImageView alloc]init];
        self.headImageView.backgroundColor = [UIColor whiteColor];
        self.headImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kGAP);
            make.width.height.mas_equalTo(kAvatar_Size);
        }];
        
        // nameLbl;
        self.nameLbl = [UILabel new];
        [self.contentView addSubview:self.nameLbl];
        self.nameLbl.textColor = [UIColor colorWithRed:(54/255.0) green:(71/255.0) blue:(121/255.0) alpha:0.9];
        self.nameLbl.preferredMaxLayoutWidth = kScreenWidth - kGAP - kAvatar_Size - 2*kGAP - kGAP;
        self.nameLbl.numberOfLines = 0;
        self.nameLbl.font = [UIFont systemFontOfSize:14.0];
        [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
            make.top.mas_equalTo(self.headImageView);
            make.right.mas_equalTo(-kGAP);
        }];
        
        // desc
        self.desclabel = [CopyAbleLabel new];
        UITapGestureRecognizer *tapText = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapText:)];
        [self.desclabel addGestureRecognizer:tapText];
        [self.contentView addSubview:self.desclabel];
        self.desclabel.preferredMaxLayoutWidth = kScreenWidth - kGAP - kAvatar_Size;
        self.desclabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.desclabel.numberOfLines = 0;
        self.desclabel.font = [UIFont systemFontOfSize:13.0];
        [self.desclabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.nameLbl);
            make.top.mas_equalTo(self.nameLbl.mas_bottom).offset(kGAP / 2.0);
        }];
        
        // 全文
        self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreBtn setTitle:@"全文" forState:0];
        [self.moreBtn setTitle:@"收起" forState:UIControlStateSelected];
        [self.moreBtn setTitleColor:[UIColor colorWithRed:92/255.0 green:140/255.0 blue:193/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.moreBtn setTitleColor:[UIColor colorWithRed:92/255.0 green:140/255.0 blue:193/255.0 alpha:1.0] forState:UIControlStateSelected];
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        self.moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.moreBtn.selected = NO;
        [self.moreBtn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.moreBtn];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.desclabel);
            make.top.mas_equalTo(self.desclabel.mas_bottom);
        }];
        
        self.jggView = [JGGView new];
        [self.contentView addSubview:self.jggView];
        [self.jggView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.moreBtn);
            make.top.mas_equalTo(self.moreBtn.mas_bottom).offset(kGAP);
        }];
        
        self.commentBtn = [UIButton buttonWithType:0];
        self.commentBtn.backgroundColor = [UIColor whiteColor];
        [self.commentBtn setTitle:@"评论" forState:0];
        [self.commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.commentBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.commentBtn.layer.borderWidth = 1;
        [self.commentBtn setImage:[UIImage imageNamed:@"commentBtn"] forState:0];
        [self.commentBtn addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
        self.commentBtn.layer.cornerRadius = 24/2;
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.desclabel);
            make.top.mas_equalTo(self.jggView.mas_bottom).offset(kGAP);
            make.width.mas_equalTo(55);
            make.height.mas_equalTo(24);
        }];
        
        self.tableview = [[UITableView alloc]init];
        self.tableview.scrollEnabled = NO;
        [self.tableview registerClass:NSClassFromString(@"CommentCell1") forCellReuseIdentifier:@"CommentCell1"];
        [self.tableview registerClass:NSClassFromString(@"LikeUsersCell1") forCellReuseIdentifier:@"LikeUsersCell1"];
        
        UIImage *image = [UIImage imageNamed:@"LikeCmtBg"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 05 topCapHeight:image.size.height * 0.5];
        self.tableview.backgroundView = [[UIImageView alloc]initWithImage:image];
        [self.contentView addSubview:self.tableview];
        self.tableview.userInteractionEnabled = YES;
        self.tableview.backgroundView.userInteractionEnabled = YES;
        [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.jggView);
            make.top.mas_equalTo(self.commentBtn.mas_bottom).offset(kGAP);
            make.right.mas_equalTo(-kGAP);
        }];
        
        self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.hyb_lastViewInCell = self.tableview;
        self.hyb_bottomOffsetToCell = kGAP;
    }
    return self;
}

- (void)tapText:(UIGestureRecognizer *)tap
{
    if (self.TaptextBlock)
    {
        UILabel *desLabel =(UILabel *)tap.view;
        self.TaptextBlock(desLabel);
    }
}

- (void)moreAction:(UIButton *)sender
{
    if (self.MoreBtnClockBlock)
    {
        self.MoreBtnClockBlock(sender, self.indexPath);
    }
}

- (void)commentAction:(UIButton *)sender
{
    if (self.CommentBtnClickBlock)
    {
        self.CommentBtnClickBlock(sender, self.indexPath);
    }
}

- (void)configCellWithModel:(MessageInfoModel1 *)model indexPatch:(NSIndexPath *)indexPatch
{
    self.indexPath = indexPatch;
    self.nameLbl.text = model.userName;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _messageModel1 = model;
    
    NSMutableParagraphStyle *muStyle = [[NSMutableParagraphStyle alloc]init];
    muStyle.lineSpacing = 3; // 设置行间距
    muStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:model.message];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13.0] range:NSMakeRange(0, attrString.length)];
    [attrString addAttribute:NSParagraphStyleAttributeName value:muStyle range:NSMakeRange(0, attrString.length)];
    self.desclabel.attributedText = attrString;
    self.desclabel.highlightedTextColor = [UIColor blackColor]; // 设置文本高亮显示的颜色，与highlighted使用
    self.desclabel.highlighted = YES; // 高亮状态是否开启
    self.desclabel.enabled = YES; // 设置文字内容是否可变
    self.desclabel.userInteractionEnabled = YES; // 开启交互
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0],
                                 NSParagraphStyleAttributeName : muStyle
                                 };
    CGFloat h = [model.message boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - kGAP-kAvatar_Size - 2*kGAP, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height+0.5;
    if (h <= 60)
    {
        [self.moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.desclabel);
            make.top.mas_equalTo(self.desclabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }
    else
    {
        [self.moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.desclabel);
            make.top.mas_equalTo(self.desclabel.mas_bottom);
        }];
    }
    
    // 展开
    if (model.isEcpand)
    {
        [self.desclabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.nameLbl);
            make.top.mas_equalTo(self.nameLbl.mas_bottom).offset(kGAP/2.0);
            make.height.mas_equalTo(h);
        }];
    }
    else
    {
        // 闭合
        [self.desclabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.nameLbl);
            make.top.mas_equalTo(self.nameLbl.mas_bottom).offset(kGAP/2.0);
            make.height.mas_lessThanOrEqualTo(60);
        }];
    }
    
    self.moreBtn.selected = model.isEcpand;
    
    CGFloat jgg_width = kScreenWidth-2*kGAP-kAvatar_Size-50;
    CGFloat image_width = (jgg_width-2*kGAP)/3;
    
    CGFloat jgg_height = 0.0;
    
    
    if (model.messageSmallPics.count==0) {
        jgg_height = 0;
    }else if (model.messageSmallPics.count<=3) {
        jgg_height = image_width;
    }else if (model.messageSmallPics.count>3&&model.messageSmallPics.count<=6){
        jgg_height = 2*image_width+kGAP;
    }else  if (model.messageSmallPics.count>6&&model.messageSmallPics.count<=9){
        jgg_height = 3*image_width+2*kGAP;
    }
    
    ///解决图片复用问题
    [self.jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.jggView.dataSource = model.messageSmallPics;
    __weak __typeof(self) weakSelf= self;
    
    self.jggView.tapBlock = ^(NSInteger index, NSArray *dataSource) {
        weakSelf.tapImageBlock(index, dataSource);
    };
    
    ///布局九宫格
    
    [self.jggView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.moreBtn);
        make.top.mas_equalTo(self.moreBtn.mas_bottom).offset(kGAP/2);
        make.size.mas_equalTo(CGSizeMake(jgg_width, jgg_height));
    }];
    
    CGFloat tableViewHeight = 0;
    for (id obj in model.commentModelArray)
    {
        if ([obj isKindOfClass:[NSArray class]])
        {
            
        }
        else
        {
            CommentInfoModel1 *commentModel = (CommentInfoModel1 *)obj;
            CGFloat cellHeight = [CommentCell1 hyb_heightForTableView:self.tableview config:^(UITableViewCell *sourceCell) {
                CommentCell1 *cell = (CommentCell1 *)sourceCell;
                [cell configCellWithModel:commentModel];
            } cache:^NSDictionary *{
                return @{kHYBCacheUniqueKey : commentModel.commentId,
                         kHYBCacheStateKey : @"",
                         kHYBRecalculateForStateKey : @(YES)
                         };
            }];
            
            tableViewHeight += cellHeight;
        }
    }
    
    [self.tableview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tableViewHeight);
    }];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview reloadData];
}

#pragma mark --tableview datasource delegate--

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        if (self.messageModel1.likeUsers.count)
        {
            LikeUserCell1 *likeUserCell = [tableView dequeueReusableCellWithIdentifier:@"LikeUserCell1"];
            likeUserCell.model = self.messageModel1;
            __weak __typeof(self) wSelf = self;
            likeUserCell.tapNameBlock = ^(FriendInfoModel *friendModel) {
                if (wSelf.tapNameBlock)
                {
                    wSelf.tapNameBlock(friendModel);
                }
            };
            return likeUserCell;
        }
    }
    
    CommentCell1 *commentCell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell1" forIndexPath:indexPath];
    CommentInfoModel1 *model1 =  self.messageModel1.commentModelArray[indexPath.row];
    [commentCell configCellWithModel:model1];
    return commentCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageModel1.commentModelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && self.messageModel1.likeUsers.count)
    {
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
        NSMutableAttributedString *mutableAttStr = [[NSMutableAttributedString alloc]init];
        NSTextAttachment *attch = [[NSTextAttachment alloc]init];
        // 定义图片内容及位置和大小
        attch.image = [UIImage imageNamed:@"Like"];
        attch.bounds = CGRectMake(0, -5, attch.image.size.width, attch.image.size.height);
        [mutableAttStr insertAttributedString:[NSMutableAttributedString attributedStringWithAttachment:attch] atIndex:0];
        for (int i=0; i<self.messageModel1.likeUsers.count; i++)
        {
            
        }
    }
    return 10.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
