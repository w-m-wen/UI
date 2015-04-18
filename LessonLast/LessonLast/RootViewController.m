//
//  RootViewController.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
  
    
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.title = @"异步图片下载";
    UINavigationController *firstNacV = [[UINavigationController alloc] initWithRootViewController:firstVC];
    [firstVC release];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.title = @"KVO";
    UINavigationController *secondNacV = [[UINavigationController alloc] initWithRootViewController:secondVC];
    [secondVC release];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.title = @"Notification";
    UINavigationController *thirdNacV = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    [thirdVC release];
    
    self.viewControllers = @[firstNacV, secondNacV, thirdNacV];
    [firstNacV release];
    [secondNacV release];
    [thirdNacV release];
    
    
   
    
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
