//
//  SecondViewController.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //KVC: 键值编码, key-value coding, 提供一种间接访问属性的方式
    
    Person *person = [[Person alloc] init];
    person.name = @"阿娇肯德基";
    [person setValue:@"金风科技" forKey:@"name"];
    
    NSLog(@"%@", person.name);
    NSLog(@"%@", [person valueForKey:@"name"]);
    
    //KVO: 键值观察, key-value observing, 观察属性值的变化
    
    //添加观察
    //self 表示当前类
    //参数1:被观察者
    //参数2. 被观察的属性
    //参数3.观察的可选参数, 观察的方式
    //NSKeyValueObservingOptionNew, 属性发生变化, 打印新的值
    //NSKeyValueObservingOptionOld, 属性发生变化, 打印旧的值
    //NSKeyValueObservingOptionInitial, 属性初始化和属性值发生变化
    //NSKeyValueObservingOptionPrior,  属性发生变化(修改前和修改后), 修改前有一个参数notificationIsPrior = 1
    //参数4.
    Person *p = [[Person alloc] init];
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionPrior context:NULL];
    NSLog(@"*********************");
    p.name = @"DDDD";
    NSLog(@"--/////**++++++++");
    p.name = @"JJJJJ";
    
    
    //移除观察者
    [p removeObserver:self forKeyPath:@"name"];
    
    //添加通知的观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eat) name:@"food" object:nil];
    
    
}


- (void)eat {
    NSLog(@"%s", __FUNCTION__);
    self.view.backgroundColor = [UIColor redColor];
}


//一旦值发生变化, 响应的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"**%@", keyPath);
    NSLog(@"//%@", object);
    NSLog(@"++%@", change);
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
