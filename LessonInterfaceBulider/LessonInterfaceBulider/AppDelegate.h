//
//  AppDelegate.h
//  LessonInterfaceBulider
//
//  Created by lanouhn on 15/4/7.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

//可视化编程, 是为了快捷的创建控件和布局
//工具: interface builder
//xib -> storyboard -> storyboard+sizeclass

//xib: xcode interface builder
//xib, 又称nib, xib是xcode中的文件类型, 编译之后成为nib
//xib的实质是xml文件
//xib的缺点:一个xib文件对应一个页面或者视图, 如果有多个页面需要创建多个xib文件

//storyboard, 故事版模式

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;


@end

