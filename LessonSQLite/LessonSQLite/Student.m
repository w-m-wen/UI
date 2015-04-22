//
//  Student.m
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)dealloc
{
    [_name release];
    [_gender release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"ID:%ld, name:%@, age:%ld, gender:%@", _ID, _name, _age, _gender ];
}

@end
