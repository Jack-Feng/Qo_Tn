//
//  FMDB_HomeVC.m
//  OC-SQLite-FMDB-Demo
//
//  Created by Qo_Tn on 2017/7/13.
//  Copyright © 2017年 Qo_Tn. All rights reserved.
//

#import "FMDB_HomeVC.h"

///**
// *  跳转枚举
// **/
//typedef NS_ENUM(NSInteger, JCFmdbSQLType)
//{
//    kFmdbCreateTable = 0,                           //   创建表，创建数据库
//    kFmdbAddTableDetails,                          //    增加
//    kFmdbDeleteTableDetails,                       //    删除
//    kFmdbUpdateTableDetails,                     //    修改
//    kFmdbSelectTableDetails                       //     查找
//};

@interface FMDB_HomeVC ()

@property (nonatomic, strong) NSMutableArray *homeArray;

@end

@implementation FMDB_HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"FMDB 使用列表";
    
    [self initData];

    self.tableView.rowHeight = 45.f;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)initData {

    NSArray *array = @[
                       @"FMDB -- 创建表",
                       @"FMDB -- 增加相关",
                       @"FMDB -- 删除相关",
                       @"FMDB -- 修改相关",
                       @"FMDB -- 查找相关"];
    
    [self.homeArray addObjectsFromArray:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.homeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.homeArray.count > 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.homeArray objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *stringController;
    switch (indexPath.row) {
        case 0:
            stringController = @"CreateTableFmdbVC";
            break;
        case 1:
            stringController = @"AddTableFmdbVC";
            break;
        case 2:
            stringController = @"DeleteTableFmdbVC";
            break;
        case 3:
            stringController = @"UpdateTableFmdbVC";
            break;
        case 4:
            stringController = @"SelectTableFmdbVC";
            break;
        default:
            break;
    }
    
    UIViewController *controller = [[NSClassFromString(stringController) alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];

}


#pragma mark-     setter&&getter  方法

- (NSMutableArray *)homeArray {

    if (!_homeArray) {
        _homeArray = [NSMutableArray array];
    }
    return _homeArray;
}


@end
