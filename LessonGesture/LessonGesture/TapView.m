//
//  TapView.m
//  LessonGesture
//
//  Created by lanouhn on 15/3/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TapView.h"

@interface TapView () {
    id _target;
    SEL _action;
    UIControlEvents _controlEvents;
}
@end

@implementation TapView

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    _target = target;
    _action = action;
    _controlEvents = controlEvents;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //如果事件类型为Touchupinside, 执行
    if (_controlEvents == UIControlEventTouchUpInside) {
        //NSObject中定义了一系类执行某个方法的API, 例如 performSelector:withObject:
        //参数1: 执行的方法, 参数2: 传递的参数 
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
