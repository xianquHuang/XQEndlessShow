//
//  ViewController.m
//  XQEndlessShow
//
//  Created by HCZH on 17/3/31.
//  Copyright © 2017年 hxq. All rights reserved.
//
#import "MJRefresh.h"
#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * listTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"我的第一个GitHub项目");
    
    listTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    listTableView.dataSource = self;
    listTableView.delegate = self;
    [self.view addSubview:listTableView];
    
    listTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       //下拉刷新
        [listTableView.mj_header endRefreshing];
        
    }];
   
    listTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //上拉更多
        
        [listTableView.mj_footer endRefreshing];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = NSLocalizedString(@"hczd full name", nil);
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
