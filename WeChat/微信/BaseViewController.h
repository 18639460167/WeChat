//
//  BaseViewController.h
//  WeChat
//
//  Created by 张帅 on 2017/10/25.
//  Copyright © 2017年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)registerCellWithNib:(NSString *)nibName tableView:(UITableView *)tableView;

- (void)registerCellWithClass:(NSString *)calssName tableView:(UITableView *)tableview;

- (int)getRandomNumber:(int)from to:(int)to;

@end
