//
//  Person.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    self.name = nil;
    self.gender = nil;
    self.phoneNumber = nil;
    self.QQ = nil;
    [super dealloc];
}

- (id)initWithName:(NSString *)name gender:(NSString *)gender phoneNumber:(NSString *)phoneNumber QQ:(NSString *)QQ {
    self = [super init];
    if (self) {
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.gender = gender;
        self.QQ = QQ;
    }
    return self;
}


+ (Person *)PersonWithName:(NSString *)name gender:(NSString *)gender phoneNumber:(NSString *)phoneNumber QQ:(NSString *)QQ {
    return [[[Person alloc] initWithName:name gender:gender phoneNumber:phoneNumber QQ:QQ] autorelease];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, gender:%@, phoneNumber:%@, QQ:%@", _name, _gender, _phoneNumber, _QQ];
}
@end
