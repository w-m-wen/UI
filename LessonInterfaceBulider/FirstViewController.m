//
//  FirstViewController.m
//  LessonInterfaceBulider
//
//  Created by lanouhn on 15/4/7.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)dealloc
{
    [_textLabel release];
    [_detailTextLabel release];
    [_labelArray release];
    [_button release];
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   self.textLabel.text = @"嘿哈";
 
    UILabel *label = [self.labelArray objectAtIndex:0];
    label.text = @"djkajd";
    
    for (UILabel *label in self.labelArray) {
        label.text = @"shfkshfk;;ll";
    }
    
    [self.button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)press {
//    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //[NSBundle mainBundle]主包
    //nibNume:默认找和类名相同的nib文件
    //bundle:默认找主包[NSBundle mainBundle]
    //viewController的创建, 先判断是否有xib文件, 如果有就从xib文件创建, 如果没有, 就从代码中创建
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
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

- (IBAction)pressButton:(UIButton *)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}
@end
