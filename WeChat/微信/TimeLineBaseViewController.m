//
//  TimeLineBaseViewController.m
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "TimeLineBaseViewController.h"

@interface TimeLineBaseViewController ()

@property (nonatomic, strong) NSDictionary *jsonDic;

@end

@implementation TimeLineBaseViewController

// 本地的json测试数据
- (NSDictionary *)jsonDic
{
    if (_jsonDic == nil)
    {
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]];
        _jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    return _jsonDic;
}

#pragma mark --从本地获取朋友群1的测试数据--
- (void)getTestData1
{
    for (NSDictionary *eachDic in self.jsonDic[@"data"][@"rows"])
    {
        MessageInfoModel1 *messageModel1 = [[MessageInfoModel1 alloc]initWithDic:eachDic];
        [self.dataSource addObject:messageModel1];
    }
}

#pragma mark --从本地获取朋友圈2的测试数据--
- (void)getTestData2
{
    self.dataSource = [NSMutableArray array];
    for (NSDictionary *eachDic in self.jsonDic[@"data"][@"rows"])
    {
        MessageInfoModel2 *messageModel = [[MessageInfoModel2 alloc] initWithDic:eachDic];
        NSLog(@"==%@",messageModel.commentModelArray);
        [self.dataSource addObject:messageModel];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"朋友圈";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[YYFPSLabel alloc]initWithFrame:CGRectMake(0, 5, 60, 30)]];
   // [self.view addSubview:self.tableview];
    
//    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 260)];
//    backgroundImageView.image = [UIImage imageNamed:@"background.jpeg"];
//    self.tableview.tableHeaderView = backgroundImageView;
//    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//        make.top.mas_equalTo(self.view).with.offset(-kNavbarHeight);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
