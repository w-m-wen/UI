//
//  DetailViewController.h
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface DetailViewController : UIViewController

@property (nonatomic, retain)Person *person;
@property (nonatomic, retain)NSIndexPath *indexpath;


@end
