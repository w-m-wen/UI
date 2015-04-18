//
//  Person.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_name release];
    [super dealloc];
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, age:%ld", _name, _age];
}

@end
