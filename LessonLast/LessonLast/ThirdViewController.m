//
//  ThirdViewController.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //通知
    //NSNotification, 通知类, 继承于NSObject
    NSNotification *nontification = [NSNotification notificationWithName:@"food" object:nil];
    NSLog(@"%@", nontification);
    
    
    //添加观察者
    //参数1: 观察者
    //参数2: 通知
    //参数3.设定观察那个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eat) name:@"food" object:nil];
    
    //NSNotificationCenter, 通知中心, 继承于NSObject, 只有一个
    
    //发送通知
//    [[NSNotificationCenter defaultCenter] postNotification:nontification];
    //直接通过通知名字, 不需要创建通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"food" object:nil];
    
}

- (void)eat {
    NSLog(@"吃饭");
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
