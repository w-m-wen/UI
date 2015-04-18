//
//  DataManager.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DataManager.h"

#import "Person.h"
#import <UIKit/UIKit.h>

@implementation DataManager

- (void)dealloc
{
    self.personDic = nil;
    self.letterArray = nil;
    [super dealloc];
}





+ (DataManager *)shareDataManager {
    static DataManager *dataManager = nil;
    if (dataManager == nil) {
        dataManager = [[DataManager alloc] init];
        //初始化数据
        dataManager.personDic = [NSMutableDictionary dictionaryWithCapacity:0];
        dataManager.letterArray = [NSMutableArray arrayWithCapacity:0];
    }
    return dataManager;
}

+ (NSInteger)numberOfRowInSection:(NSInteger)section {
    DataManager *dataManager = [DataManager shareDataManager];
    
    //获取分区的标题
    NSString *key = [dataManager.letterArray objectAtIndex:section];
    
    //通过key值在字典中找key对应的value
    NSMutableArray *tempArray = [dataManager.personDic objectForKey:key];
    
    //返回分区的行数
    return tempArray.count;
    
}


+ (Person *)personAtIndexPath:(NSIndexPath *)indexPath {
    DataManager *dataManager = [DataManager shareDataManager];
    //在找到分区的标题
    NSString *key = [dataManager.letterArray objectAtIndex:indexPath.section];
    //找分区对应的数组
    NSMutableArray *tempArray = [dataManager.personDic objectForKey:key];
    //找到person对象
    Person *person = [tempArray objectAtIndex:indexPath.row];
    
    return person;
    
}
//添加联系人
+ (void)addPerson:(Person *)person {
    //获取首字母
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:person.name];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //先传化为拼音
    NSString *pinYin = [str capitalizedString];
    //获取首字母
    NSString *firstLetter = [pinYin substringToIndex:1];
    
    //2.根据首字母在字典中找对应的数组
    DataManager *dataManager = [DataManager shareDataManager];
    NSMutableArray *tempArray = [dataManager.personDic objectForKey:firstLetter];
    //判断数组是否存在
    if (tempArray == nil) {
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:0];
        [mArray addObject:person];
        [dataManager.personDic setObject:mArray forKey:firstLetter];
    
    } else {
        [tempArray addObject:person];
    }
    
    //更新分组标题
    dataManager.letterArray = [NSMutableArray arrayWithArray:[dataManager.personDic.allKeys sortedArrayUsingSelector:@selector(compare:)]];
 
}

//修改联系人信息
+ (void)modifyAtIndexPath:(NSIndexPath *)indexPath withPerson:(Person *)person {
    //删除原来的数据, 此时self相当于DataManager
    [DataManager removePersonAtIndexPath:indexPath];
    //添加新数据
    [DataManager addPerson:person];
}

+ (void)removePersonAtIndexPath:(NSIndexPath *)indexPath {
    DataManager *dataManager = [DataManager shareDataManager];
    //首字母
    NSString *key = [dataManager.letterArray objectAtIndex:indexPath.section];
    //找数组
    NSMutableArray *mArray = [dataManager.personDic objectForKey:key];
    
    //删除person
    [mArray removeObjectAtIndex:indexPath.row];
    //判断数组是否还有对象
    if (mArray.count == 0) {
        [dataManager.personDic removeObjectForKey:key];
        [dataManager.letterArray removeObjectAtIndex:indexPath.section];
        
    }
    
}

@end
