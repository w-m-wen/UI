//
//  Student.h
//  LessonSQLite
//
//  Created by lanouhn on 15/4/14.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *gender;
@property (nonatomic, assign)NSInteger age;



@end
