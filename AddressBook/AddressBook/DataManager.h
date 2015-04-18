//
//  DateManager.h
//  AddressBook
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

//单例模式, 用于去保证数据的唯一性

//单例的创建
//1.类方法
//2.返回值是当前类
//3.方法名:share/default/main + 类名


+ (DataManager *)shareDatamanger;

@property (nonatomic, retain)NSString *name;


@end
