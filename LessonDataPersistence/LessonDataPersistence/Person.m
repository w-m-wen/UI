//
//  Person.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/4/13.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_age release];
    [_name release];
    [_gender release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, age:%@, gender:%@", _name, _age, _gender];
}

#pragma mark -- NSCoding


- (void)encodeWithCoder:(NSCoder *)aCoder {
    //进行编码
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeObject:self.age forKey:@"AGE"];
    [aCoder encodeObject:self.gender forKey:@"GENDER"];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        //解码!
        self.name = [aDecoder decodeObjectForKey:@"NAME"];
        self.age = [aDecoder decodeObjectForKey:@"AGE"];
        self.gender = [aDecoder decodeObjectForKey:@"GENDER"];
    }
    return self;
}

@end
