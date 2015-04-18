//
//  FirstViewController.m
//  AddressBook
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "DataManager.h"

@interface FirstViewController ()

{
    UITextField *textField;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 335, 40)];
    textField.placeholder = @"请输入";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    [textField release];
    
    
    
    
}

- (void)tap {
    DataManager *dataManager = [DataManager shareDatamanger];
    dataManager.name = textField.text;
    
    
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
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

@end
