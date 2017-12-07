//
//  LikeUsersCell.m
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "LikeUsersCell.h"
#import "UILabel+TapAction.h"


@implementation LikeUsersCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.likeUsersLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.likeUsersLabel.font = [UIFont systemFontOfSize:13];
        self.likeUsersLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.likeUsersLabel.numberOfLines = 0;
        [self addSubview:self.likeUsersLabel];
        
        UIImage *image = [UIImage imageNamed:@"LikeCmtBg"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        self.backgroundView = [[UIImageView alloc]initWithImage:image];
    }
    return self;
}

- (void)setModel:(CommentInfoModel2 *)model
{
    _model = model;
    self.likeUsersLabel.attributedText = model.likeUsersAttributedText;
    
    [self.likeUsersLabel tapActionWithStrings:self.likeUsersArray tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"name=%@,index=%ld",string,(long)index);
    }];
}

#pragma mark --cell左边缩进leftSpace，右边缩进10--

- (void)setFrame:(CGRect)frame
{
    CGFloat leftSapce = 2*kGAP + kAvatar_Size;
    frame.origin.x = leftSapce;
    frame.size.width = kScreenWidth - leftSapce - 10;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
