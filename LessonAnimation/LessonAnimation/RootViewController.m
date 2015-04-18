//
//  RootViewController.m
//  LessonAnimation
//
//  Created by lanouhn on 15/4/15.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewAnimationController.h"
#import "CALayerAnimationController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIViewAnimationController *ViewAnimationVC = [[UIViewAnimationController alloc] init];
    ViewAnimationVC.title = @"UIView动画";
    UINavigationController *animationNacV = [[UINavigationController alloc] initWithRootViewController:ViewAnimationVC];
    [ViewAnimationVC release];
    
    CALayerAnimationController *LayerAnimationVC = [[CALayerAnimationController alloc] init];
    LayerAnimationVC.title = @"CAL动画";
    UINavigationController *CALNCV = [[UINavigationController alloc] initWithRootViewController:LayerAnimationVC];
    [LayerAnimationVC release];
    
    self.viewControllers = @[CALNCV, animationNacV];
    [animationNacV release];
    [CALNCV release];
    
    
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
