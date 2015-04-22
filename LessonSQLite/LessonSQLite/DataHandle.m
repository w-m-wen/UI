//
//  DataHandle.m
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DataHandle.h"
#import "DataBase.h"
#import "Student.h"

@implementation DataHandle

//查询所有的学生
+ (NSArray *)showAllStudent {
    //打开数据库, 返回数据库指针
    sqlite3 *db = [DataBase openDB];
    //sql语句管理类, stmt:statement
    sqlite3_stmt *stmt = nil;
    //sql语句
    NSString *sqlString = @"select * from Student";
    //验证语句的正确性
    //参数1:数据库指针
    //参数2:sql语句
    //参数3:sql语句的长度, -1表示无穷大,长度自己计算
    //参数4:sql语句的管理类指针
    //参数5:为未来坐准备的
    int result = sqlite3_prepare_v2(db, [sqlString UTF8String], -1, &stmt, NULL);
    
    //创建数组,用于存储查询到的student对象
    NSMutableArray *studentArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    //判断语句验证结果
    if (result == SQLITE_OK) {
        //单步执行语句
        //因为只知道循环的条件, 用while循环
        //结束条件: 判断是否后面还有数据
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //有一条数据, 创建一个Student对象
            
            //获取数据
            //参数1:数据库管理指针
            //参数2:第几列, 列数从0开始的
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            int age = sqlite3_column_int(stmt, 2);
            const unsigned char *gender = sqlite3_column_text(stmt, 3);
            
            //创建student对象
            Student *student = [[Student alloc] init];
            student.ID = ID;
            student.name = [NSString stringWithUTF8String:(const char *)name];
            student.age = age;
            student.gender = [NSString stringWithUTF8String:(const char *)gender];
            //添加到数组
            [studentArray addObject:student];
            [student release];
        }
    }
    [DataBase closeDB];
    return [studentArray autorelease];
 
}

//添加学生
+ (void)addStudent:(Student *)student {
    //打开数据库
    sqlite3 *db = [DataBase openDB];
    //语句管理指针
    sqlite3_stmt *stmt = nil;
    //sql语句
    NSString *sqlString = [NSString stringWithFormat:@"insert into Student values (%ld, \"%@\", %ld, \"%@\")", student.ID, student.name, student.age, student.gender];
    //准备语句
    int result = sqlite3_prepare_v2(db, [sqlString UTF8String], -1, &stmt, NULL);
    //判断语句
    if (result == SQLITE_OK) {
        /*
        //执行语句
        //参数1.数据库指针
        //参数2.sql语句
        //参数3.回调函数
        //参数4.callback中的第一个参数
        //参数5.错误信息
        char *error = nil;
        sqlite3_exec(db, [sqlString UTF8String], nil, nil, &error);
        if (error) {
            NSLog(@"出现错误:%s", error);
        } else {
            NSLog(@"添加成功");
        }
         */
        
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            NSLog(@"添加成功");
        }
    }
    [DataBase closeDB];
    
}

//修改学生的姓名
+ (void)modifyStudentWithName:(NSString *)name atID:(NSInteger)ID {
    //打开数据库
    sqlite3 *db = [DataBase openDB];
    //sql语句管理类
    sqlite3_stmt *stmt = nil;
    //sql语句
    NSString *sqlString = [NSString stringWithFormat:@"update Student set name = \"%@\" where id = %ld", name, ID];
    //准备语句
    int result = sqlite3_prepare_v2(db, [sqlString UTF8String], -1, &stmt, NULL);
    //判断语句的正确性
    if (result == SQLITE_OK && sqlite3_step(stmt) == SQLITE_DONE) {
        NSLog(@"修改成功");
    }
    [DataBase closeDB];
}

//删除某个学生的信息
+ (void)removeStudentWithID:(NSInteger)ID {
    //打开数据库
    sqlite3 *db = [DataBase openDB];
    //创建sql语句管理类
    sqlite3_stmt *stmt = nil;
    //sql语句
    NSString *sqlString = [NSString stringWithFormat:@"delete from Student where id = %ld", ID];
    //准备语句
    int result = sqlite3_prepare_v2(db, [sqlString UTF8String], -1, &stmt, NULL);
    //判断语句的正确性
    if (result == SQLITE_OK && sqlite3_step(stmt) == SQLITE_DONE) {
        NSLog(@"删除成功");
    }
    [DataBase closeDB];
}

//查询某个学生
+ (Student *)searchStudentWithID:(NSInteger)ID {
    sqlite3 *db = [DataBase openDB];
    sqlite3_stmt *stmt = nil;
    NSString *sqlString = [NSString stringWithFormat:@"select * from Student where id = %ld", ID];
    int result = sqlite3_prepare_v2(db, [sqlString UTF8String], -1, &stmt, NULL);
    Student *student = nil;
    if (result == SQLITE_OK && sqlite3_step(stmt) == SQLITE_ROW) {
            int ID = ID;
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            int age = sqlite3_column_int(stmt, 2);
            const unsigned char *gender = sqlite3_column_text(stmt, 3);
            
            //创建student对象
            student = [[Student alloc] init];
            student.ID = ID;
            student.name = [NSString stringWithUTF8String:(const char *)name];
            student.age = age;
            student.gender = [NSString stringWithUTF8String:(const char *)gender];
        
    }
    [DataBase closeDB];
    return [student autorelease];
}

//fmdb: 对sqlite的封装, 原声的API是用C语言写的, fmdb用的是OC语言--+++++


@end
