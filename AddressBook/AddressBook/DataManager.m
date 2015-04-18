//
//  DateManager.m
//  AddressBook
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

- (void)dealloc
{
    self.name = nil;
    [super dealloc];
}

//单例需要注意的问题
//1.创建的时候使用[ shareDataManager]
//2.单例不需要释放
//3.单例中不能存放大量数据

+ (DataManager *)shareDatamanger {
    //用static修饰, 存放在全局静态区域, 直到程序结束才释放
    static DataManager *dataManager = nil;
    //判断dataManager是否为nil, 保证只初始化一次
    if (dataManager == nil) {
        dataManager = [[DataManager alloc] init];
    }
    return dataManager;
}



@end
