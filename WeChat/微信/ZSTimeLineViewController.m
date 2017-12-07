//
//  ZSTimeLineViewController.m
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "ZSTimeLineViewController.h"
#import "TimeLineHeaderView.h"
#import "CommentCell.h"
#import "LikeUsersCell.h"

@interface ZSTimeLineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZSTimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getTestData2];
    self.tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableview.tableFooterView = [UIView new];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.dataSource  =self;
    self.tableview.delegate = self;
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 260)];
    backgroundImageView.image = [UIImage imageNamed:@"background.jpeg"];
    self.tableview.tableHeaderView = backgroundImageView;
    [self.tableview registerClass:NSClassFromString(@"TimeLineHeaderView") forHeaderFooterViewReuseIdentifier:@"TimeLineHeaderView"];
    [self registerCellWithClass:@"CommentCell" tableView:self.tableview];
    [self registerCellWithClass:@"LikeUsersCell" tableView:self.tableview];
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
//显示评论的数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MessageInfoModel1 *eachModel = self.dataSource[section];
    return eachModel.commentModelArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInfoModel2 *eachModel = self.dataSource[indexPath.section];
    CommentInfoModel2  *commentModel =  eachModel.commentModelArray[indexPath.row];
    return commentModel.rowHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    MessageInfoModel2 *eachModel = self.dataSource[section];
    return eachModel.headerHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TimeLineHeaderView *headerView = (TimeLineHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TimeLineHeaderView"];
    MessageInfoModel2 *eachModel = self.dataSource[section];
    headerView.mdoel = eachModel;
    return headerView;
}
///footer高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
///footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10.f)];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInfoModel2 *eachModel = self.dataSource[indexPath.section];
    CommentInfoModel2  *commentModel =  eachModel.commentModelArray[indexPath.row];
    if (commentModel.likeUsersArray.count)
    {
        LikeUsersCell *likeUsersCell = (LikeUsersCell *)[tableView dequeueReusableCellWithIdentifier:@"LikeUsersCell"];
        likeUsersCell.likeUsersArray = eachModel.likeUserNameArray;
        likeUsersCell.model = commentModel;
        return likeUsersCell;
    }
    else
    {
        CommentCell *cell2 = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        cell2.model = commentModel;
        return cell2;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"%s",__FUNCTION__);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    NSLog(@"%s",__FUNCTION__);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
