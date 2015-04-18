//
//  ImageCell.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end
