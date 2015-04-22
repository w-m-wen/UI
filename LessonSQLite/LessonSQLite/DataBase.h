//
//  DataBase.h
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

//支持sqlite数据库, 步骤
//1.添加libsqlite3.0.dylib
//2.引入头文件sqlite.h

#import <sqlite3.h>

//数据库管理类, 负责数据库的打开和关闭


@interface DataBase : NSObject

//打开数据库, 返回数据库指针
+ (sqlite3 *)openDB;
//关闭数据库
+ (void)closeDB;


@end
