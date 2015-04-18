//
//  Person.h
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, retain)NSString *name, *gender, *phoneNumber, *QQ;

- (id)initWithName:(NSString *)name gender:(NSString *)gender phoneNumber:(NSString *)phoneNumber QQ:(NSString *)QQ;

+ (Person *)PersonWithName:(NSString *)name gender:(NSString *)gender phoneNumber:(NSString *)phoneNumber QQ:(NSString *)QQ;

@end
