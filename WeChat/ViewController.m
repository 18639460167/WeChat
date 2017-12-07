//
//  ViewController.m
//  WeChat
//
//  Created by 张帅 on 2017/10/23.
//  Copyright © 2017年 Black. All rights reserved.
//

#import "ViewController.h"
#import "ZSTimeLineViewController.h"
#import "TimeLineBaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    TimeLineBaseViewController *vc = [TimeLineBaseViewController new];
    [vc getTestData2];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[ZSTimeLineViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
