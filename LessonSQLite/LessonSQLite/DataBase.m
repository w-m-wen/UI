//
//  DataBase.m
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DataBase.h"

//定义一个全局的静态变量, 存储数据库指针
static sqlite3 *db = nil;

@implementation DataBase


//打开数据库, 返回数据库指针
+ (sqlite3 *)openDB {
    if (db == nil) {
        NSLog(@"数据库没有打开");
        
        //Library, Database.sqlite
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
        NSString *filePath = [libraryPath stringByAppendingPathComponent:@"DataBase.sqlite"];
        NSLog(@"%@", filePath);
        
        //判断文件是否存在]
        NSFileManager *fm = [NSFileManager defaultManager];
        if ([fm fileExistsAtPath:filePath] == NO) {
            //文件不存在
            
            //因为bundle中文件是只读的, 从bundle中把文件拷贝到Library中
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"DataBase" ofType:@"sqlite"];
            NSError *error = nil;
            BOOL result = [fm copyItemAtPath:bundlePath toPath:filePath error:&error];
            if (result) {
                NSLog(@"拷贝成功");
            } else {
                NSLog(@"拷贝失败:%@", error);
            }
            //创建文件
        }
        
        //打开数据库
        //参数1: 数据库文件的路径
        //参数2: 用于存储数据库指针
        //使用UTF8String把oc中的字符串转换成c语言中的字符窜
        sqlite3_open([filePath UTF8String], &db);
    }
    return db;
    
}
//关闭数据库
+ (void)closeDB {
    sqlite3_close(db);
    db = nil;
}



@end
