//
//  RootViewController.m
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "DataHandle.h"
#import "Student.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //数据库, 存数数据的仓库
    //仓库需要管理, 数据库管理软件
    
    //最常使用的数据库是 关系型数据库
    //移动端考虑到硬件配置, 常使用轻量型数据库, 比如sqlite
    
    //sqlite, 体积小, 大部分的管理操作都支持, 官网www.sqlite.org
    
    //数据库常用的操作, 新建 和 增,删,改,查
    
    //1.通过数据库管理软件进行操作
    
    //2.通过代码进行操作
    
    //SQL, 格式化查询语句, 用于对数据库进行操作的语言
    //1.新建
    //creat tabel 表名 (字段名 字段类型 是否主键 默认值 是否为空, 字段名 字段类型,...)
    //主键, 用于保证数据唯一的字段, 不能为空, 也不能重复
    
    //2.添加
    //insert into 表名 values (值1, 值2, 值3,...)
    //insert into 表名 (字段1, 字段2, 字段3,...) values (值1, 值2, 值3,...)
    
    //3.修改
    //update 表名 set 列名 = 新值 where 主键 = 值
    
    //4.删除(慎重)
    //delete from 表名 where 主键 = 值
    
    //5.查找
    //select * from 表名                   用于查找所有
    //select * from 表名 where 字段名 = 值
    //select 字段名1, 字段名2,... from 表名 where 字段名 = 值
    
    //查询所有学生的
    NSArray *studentArray = [DataHandle showAllStudent];
    NSLog(@"%@", studentArray);
    
    //新学生
    Student *student = [[Student alloc] init];
    student.ID = 123;
    student.name = @"john";
    student.age = 20;
    student.gender = @"男";
    
    [DataHandle addStudent:student];
    [student release];
    NSLog(@"%@", [DataHandle showAllStudent]);
    
    [DataHandle modifyStudentWithName:@"嘎嘎的" atID:2];
    NSLog(@"***%@", [DataHandle showAllStudent]);

    
    [DataHandle removeStudentWithID:1];
    NSLog(@"%@", [DataHandle showAllStudent]);
    
    Student *student1 = [DataHandle searchStudentWithID:3];
    NSLog(@"%@", student1);
    
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
