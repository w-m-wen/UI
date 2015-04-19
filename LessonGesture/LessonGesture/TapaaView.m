//
//  TapaaView.m
//  LessonGesture
//
//  Created by lanouhn on 15/3/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TapaaView.h"

@interface TapaaView (){
    id _target;
    SEL _action;
    UIControlEvents _controlEvents;
    
}

@end


@implementation TapaaView


- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    _target = target;
    _action = action;
    _controlEvents = controlEvents;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_controlEvents == UIControlEventTouchUpInside) {
        [_target performSelector:_action withObject:self];
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
