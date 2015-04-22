//
//  DataHandle.h
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@interface DataHandle : NSObject

//查询所有的学生
+ (NSArray *)showAllStudent;

//添加学生
+ (void)addStudent:(Student *)student;

//修改学生的姓名
+ (void)modifyStudentWithName:(NSString *)name atID:(NSInteger)ID;

//删除某个学生的信息
+ (void)removeStudentWithID:(NSInteger)ID;

//查询某个学生
+ (Student *)searchStudentWithID:(NSInteger)ID;


@end
