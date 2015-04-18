//
//  DataManager.h
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface DataManager : NSObject

//存放联系人的字典, key是字母, value是数组, 数组中存放的是person对象
@property (nonatomic, retain)NSMutableDictionary *personDic;
//存放分区的标题, 并且是按照A- Z排好序的
@property (nonatomic, retain)NSMutableArray *letterArray;


+ (DataManager *)shareDataManager;

//返回某个分区的行数
+ (NSInteger)numberOfRowInSection:(NSInteger)section;

//返回某个人
+ (Person *)personAtIndexPath:(NSIndexPath *)indexPath;

//添加联系人
+ (void)addPerson:(Person *)person;

//修改某个联系人
+ (void)modifyAtIndexPath:(NSIndexPath *)indexPath withPerson:(Person *)person;

//删除联系人
+ (void)removePersonAtIndexPath:(NSIndexPath *)indexPath;


@end
