//
//  LikeUserCell1.m
//  WeChat
//
//  Created by 张帅 on 2017/10/27.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "LikeUserCell1.h"
#import "FriendInfoModel.h"
#import "UILabel+TapAction.h"

@interface LikeUserCell1()<TapActionDelegate>

@property (nonatomic, strong) NSMutableArray *likeUsersArray;
@property (nonatomic, strong) NSMutableArray *nameArray;
@end
@implementation LikeUserCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (NSMutableArray *)nameArray
{
    if (_nameArray == nil)
    {
        _nameArray = [NSMutableArray array];
    }
    return _nameArray;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.likeUsersLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.likeUsersLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.likeUsersLabel.numberOfLines = 0;
        self.likeUsersLabel.font = [UIFont systemFontOfSize:13];
        self.likeUsersLabel.textColor = [UIColor blackColor];
        [self addSubview:self.likeUsersLabel];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setModel:(MessageInfoModel1 *)model
{
    _model = model;
    _likeUsersArray = model.likeUsers.mutableCopy;
    NSMutableArray *rangesArray = [NSMutableArray array];
    NSMutableAttributedString *mutableAttrStr = [[NSMutableAttributedString alloc]init];
    NSTextAttachment *attch = [[NSTextAttachment alloc]init];
    // 定义图片内容以及位置和带下
    attch.image = [UIImage imageNamed:@"Like"];
    attch.bounds = CGRectMake(0, -5, attch.image.size.width, attch.image.size.height);
    // 创建带有图片的富文本
    [mutableAttrStr insertAttributedString:[NSAttributedString attributedStringWithAttachment:attch] atIndex:0];
    
    for (int i=0; i<model.likeUsers.count; i++)
    {
        FriendInfoModel *frinendModel = model.likeUsers[i];
        
        // name0,name1,name2
        [mutableAttrStr appendAttributedString:[[NSAttributedString alloc]initWithString:frinendModel.userName]];
        if ([self.nameArray containsObject:frinendModel.userName])
        {
            // 如果前面有人和我重复名字了
            frinendModel.range = NSMakeRange(mutableAttrStr.length - frinendModel.userName.length, frinendModel.userName.length);
        }
        else
        {
            frinendModel.range = [mutableAttrStr.string rangeOfString:frinendModel.userName];
        }
        if (i != model.likeUsers.count - 1)
        {
            [mutableAttrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@","]];
        }
        
        [rangesArray addObject:[NSValue valueWithRange:frinendModel.range]];
        [self.nameArray addObject:frinendModel.userName];
    }
    
    [mutableAttrStr addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.f]} range:NSMakeRange(0, mutableAttrStr.length)];
    
    NSMutableParagraphStyle *style= [[ NSMutableParagraphStyle alloc]init];
    style.lineSpacing = 0;
    [mutableAttrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, mutableAttrStr.length)];
    // 给指定文字添加颜色
    for (NSValue *aRangeValue in rangesArray)
    {
        [mutableAttrStr addAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} range:aRangeValue.rangeValue];
    }
    
    self.likeUsersLabel.attributedText = mutableAttrStr;
    
}

- (void)tapReturnString:(NSString *)string
                  range:(NSRange)range
                  index:(NSInteger)index
{
    FriendInfoModel *aModel = self.likeUsersArray[index];
    if (self.tapNameBlock)
    {
        self.tapNameBlock(aModel);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
