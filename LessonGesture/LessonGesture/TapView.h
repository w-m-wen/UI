//
//  TapView.h
//  LessonGesture
//
//  Created by lanouhn on 15/3/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapView : UIView

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
