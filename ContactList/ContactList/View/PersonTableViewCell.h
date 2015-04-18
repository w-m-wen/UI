//
//  PersonTableViewCell.h
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface PersonTableViewCell : UITableViewCell

@property (nonatomic, retain)UILabel *familyNameLabel, *nameLabel, *phoneLabel;
@property (nonatomic, retain)Person *person;

@end
