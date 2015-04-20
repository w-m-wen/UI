//
//  LTView.m
//  LessonPackPro
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "LTView.h"
#define kMARGIN 20
@implementation LTView

- (void)dealloc
{
    [_label release];
    [_textField release];
    [super dealloc];
}

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //label
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3 - kMARGIN, frame.size.height)];
        _label.textAlignment = NSTextAlignmentRight;
        [self addSubview:_label];
        [_label release];
        
        //textField
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(_label.frame.size.width + kMARGIN, 0, 2 * frame.size.width / 3 - kMARGIN, frame.size.height)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_textField];
        [_textField release];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
