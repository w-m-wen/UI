//
//  PersonTableViewCell.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PersonTableViewCell.h"

#import "Person.h"

#define MAGAIN 10
#define VIEW_SIZE 50
#define LABEL_HEIGH 20

@implementation PersonTableViewCell

- (void)dealloc
{
    self.familyNameLabel = nil;
    self.nameLabel = nil;
    self.phoneLabel = nil;
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
        
        self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel release];
        
        self.familyNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.familyNameLabel.layer.cornerRadius = VIEW_SIZE / 2;
        self.familyNameLabel.layer.borderWidth = 1;
        self.familyNameLabel.layer.borderColor = [UIColor greenColor].CGColor;
        self.familyNameLabel.clipsToBounds = YES;
        self.familyNameLabel.font = [UIFont systemFontOfSize:45];
    
        self.familyNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_familyNameLabel];
        [_familyNameLabel release];
    
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.familyNameLabel.frame = CGRectMake(MAGAIN, MAGAIN, VIEW_SIZE, VIEW_SIZE);
    self.nameLabel.frame = CGRectMake(MAGAIN * 2 + VIEW_SIZE, MAGAIN, self.frame.size.width - 3 * MAGAIN - VIEW_SIZE, LABEL_HEIGH);
    self.phoneLabel.frame = CGRectMake(MAGAIN * 2 + VIEW_SIZE, 2 * MAGAIN + LABEL_HEIGH, self.frame.size.width - 3 * MAGAIN - VIEW_SIZE, LABEL_HEIGH);
    
    
    
}


- (void)setPerson:(Person *)person {
    if (_person != person) {
        [_person release];
        _person = [person retain];
    }
    self.familyNameLabel.text = [person.name substringToIndex:1];
    self.nameLabel.text = person.name;
    self.phoneLabel.text = person.phoneNumber;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
