//
//  FirstViewController.h
//  LessonInterfaceBulider
//
//  Created by lanouhn on 15/4/7.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

//在代码中访问xib的控件, 使用IBOutlet
//圈代表:当前IBOutlet还没有关联
//实心圈代表: 当前的IBOutlet已经关联
//注:IBOutlet是一一对对应的, 只能关联一个控件

//IBOutletCollection用于去关联多个控件
//1.控件必须相同
//2.一般把具有相同功能和样式的控件放在Collection

//删除关联的步骤
//删除property
//2.dealloc中删除release
//3.xib文件中删除关联

//IBAction: 关联的事件

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (retain, nonatomic) IBOutlet UILabel *detailTextLabel;
@property (retain, nonatomic) IBOutletCollection(UILabel) NSArray *labelArray;
@property (retain, nonatomic) IBOutlet UIButton *button;

- (IBAction)pressButton:(UIButton *)sender;

@end
